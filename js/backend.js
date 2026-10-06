/* ============================================================
   BACKEND · Supabase auth, cloud sync, AI proxy, leaderboard
   ------------------------------------------------------------
   Offline-first: localStorage stays the primary store and the
   app works with no login. When ENV_CONFIG has Supabase keys and
   the user signs in, progress syncs across devices.

   Loaded with `defer` BEFORE app.js, so it only defines things
   here; backendInit() runs on DOMContentLoaded (after app.js).
   ============================================================ */
const SYNC_META_KEY='placeedge.syncmeta';   // {userId, version} of the last successful sync
const SYNC_DEBOUNCE_MS=3000;

let sb=null;                 // Supabase client (null = cloud disabled)
let peUser=null;             // current auth user
let peProfile=null;          // row from public.profiles
let syncTimer=null, syncing=false, syncAgain=false, applyingRemote=false;
let syncStatus='off';        // off | idle | syncing | ok | error | offline

function backendConfigured(){
  const c=window.ENV_CONFIG||{};
  return !!(c.SUPABASE_URL && c.SUPABASE_ANON_KEY && window.supabase && typeof window.supabase.createClient==='function');
}
function cloudConfigured(){ const c=window.ENV_CONFIG||{}; return !!(c.SUPABASE_URL && c.SUPABASE_ANON_KEY); }

/* ---------- boot ---------- */
async function backendInit(){
  try{ localStorage.removeItem('groq_api_key'); }catch(e){}   // old builds stored a Groq key in the browser
  if(!backendConfigured()){ renderAccountChip(); return; }
  const c=window.ENV_CONFIG;
  sb=window.supabase.createClient(c.SUPABASE_URL, c.SUPABASE_ANON_KEY, {
    auth:{ persistSession:true, autoRefreshToken:true, detectSessionInUrl:true, flowType:'pkce' }  // pkce: OAuth code arrives in ?query, not #hash (the router uses the hash)
  });
  // Docs: don't await other Supabase calls inside this callback → defer with setTimeout.
  sb.auth.onAuthStateChange((event, session)=>{
    if(event==='PASSWORD_RECOVERY'){ setTimeout(openNewPasswordModal,0); }
    setTimeout(()=>onUserChanged(session?session.user:null, event),0);
  });
  addEventListener('online', ()=>{ if(peUser) scheduleSync(0); });
  addEventListener('offline', ()=>setSyncStatus('offline'));
  refreshContent();
}
document.addEventListener('DOMContentLoaded', backendInit);

async function onUserChanged(user, event){
  const prevId=peUser?peUser.id:null, nextId=user?user.id:null;
  peUser=user;
  if(prevId===nextId){ renderAccountChip(); return; }      // token refresh etc.
  if(!user){
    peProfile=null; setSyncStatus('off');
    if(['settings','leaderboard'].includes(route.page)) render();
    return;
  }
  await loadProfile();
  setSyncStatus('idle');
  if(event==='SIGNED_IN') toast(`Signed in as ${esc(peProfile?.display_name||user.email||'you')}`,'','👋');
  await syncNow();
  if(['settings','leaderboard'].includes(route.page)) render();
}

async function loadProfile(){
  if(!sb||!peUser) return;
  const {data,error}=await sb.from('profiles').select('display_name,avatar_url,show_on_leaderboard,is_admin').eq('id',peUser.id).maybeSingle();
  if(error) console.warn('profile load failed',error);
  peProfile=data||{display_name:peUser.email?peUser.email.split('@')[0]:'Student', show_on_leaderboard:true, is_admin:false};
  renderAccountChip();
}

/* ============================================================
   AUTH UI
   ============================================================ */
function appUrl(){ return location.origin+location.pathname; }

function openAccount(){ peUser?openAccountModal():openAuthModal('login'); }

function openAuthModal(mode='login'){
  if(!sb){ toast('Cloud login is not set up yet — see supabase/SETUP.md','','⚙️'); return; }
  const isSignup=mode==='signup';
  openModal(`
    <h3>${isSignup?'✨ Create your PlaceEdge account':'👋 Welcome back'}</h3>
    <div class="m-sub">Sync progress across laptop &amp; phone, join friend leaderboards and use Milo AI.</div>
    <div class="tabs" style="margin-bottom:14px">
      <button id="auth-tab-login" class="${!isSignup?'active':''}" onclick="openAuthModal('login')">Log in</button>
      <button id="auth-tab-signup" class="${isSignup?'active':''}" onclick="openAuthModal('signup')">Sign up</button>
    </div>
    <button class="btn ghost auth-google" id="auth-google-btn" onclick="signInWithGoogle()">
      <svg width="16" height="16" viewBox="0 0 48 48" aria-hidden="true"><path fill="#FFC107" d="M43.6 20.5H42V20H24v8h11.3C33.7 32.7 29.2 36 24 36c-6.6 0-12-5.4-12-12s5.4-12 12-12c3.1 0 5.8 1.2 7.9 3.1l5.7-5.7C34 6.1 29.3 4 24 4 12.9 4 4 12.9 4 24s8.9 20 20 20 20-8.9 20-20c0-1.3-.1-2.4-.4-3.5z"/><path fill="#FF3D00" d="M6.3 14.7l6.6 4.8C14.7 15.1 19 12 24 12c3.1 0 5.8 1.2 7.9 3.1l5.7-5.7C34 6.1 29.3 4 24 4 16.3 4 9.7 8.3 6.3 14.7z"/><path fill="#4CAF50" d="M24 44c5.2 0 9.9-2 13.4-5.2l-6.2-5.2C29.2 35.1 26.7 36 24 36c-5.2 0-9.6-3.3-11.3-8l-6.5 5C9.5 39.6 16.2 44 24 44z"/><path fill="#1976D2" d="M43.6 20.5H42V20H24v8h11.3c-.8 2.2-2.2 4.2-4.1 5.6l6.2 5.2C37 39.2 44 34 44 24c0-1.3-.1-2.4-.4-3.5z"/></svg>
      Continue with Google
    </button>
    <div class="auth-or"><span>or use email</span></div>
    <form id="auth-form" onsubmit="event.preventDefault();submitAuth('${mode}')">
      ${isSignup?`<label class="auth-label" for="auth-name">Name</label>
      <input class="searchbox auth-input" id="auth-name" maxlength="40" autocomplete="name" placeholder="Your name (shown on leaderboards)">`:''}
      <label class="auth-label" for="auth-email">Email</label>
      <input class="searchbox auth-input" id="auth-email" type="email" required autocomplete="email" placeholder="you@college.edu">
      <label class="auth-label" for="auth-pass">Password</label>
      <input class="searchbox auth-input" id="auth-pass" type="password" required minlength="8" autocomplete="${isSignup?'new-password':'current-password'}" placeholder="${isSignup?'At least 8 characters':'Your password'}">
      <div id="auth-msg" class="auth-msg"></div>
      <div class="m-actions">
        ${!isSignup?`<button type="button" class="btn ghost" id="auth-forgot-btn" onclick="forgotPassword()">Forgot password?</button>`:''}
        <button type="submit" class="btn pri" id="auth-submit-btn">${isSignup?'Create account':'Log in'}</button>
      </div>
    </form>
    <div class="auth-foot">Your progress on this device is merged into your account on first login — nothing is lost.</div>`);
  setTimeout(()=>{ const el=document.getElementById(isSignup?'auth-name':'auth-email'); if(el) el.focus(); },60);
}

function authMsg(text, ok=false){
  const el=document.getElementById('auth-msg');
  if(el){ el.textContent=text; el.className='auth-msg '+(ok?'ok':'err'); }
}

async function submitAuth(mode){
  const email=document.getElementById('auth-email').value.trim();
  const password=document.getElementById('auth-pass').value;
  const btn=document.getElementById('auth-submit-btn');
  btn.disabled=true; authMsg('');
  try{
    if(mode==='signup'){
      const name=(document.getElementById('auth-name').value||'').trim().slice(0,40);
      const {data,error}=await sb.auth.signUp({email,password,options:{data:{full_name:name||undefined},emailRedirectTo:appUrl()}});
      if(error) throw error;
      if(!data.session){ authMsg('Almost there! Check your inbox and click the confirmation link, then log in.',true); return; }
      closeModal();
    }else{
      const {error}=await sb.auth.signInWithPassword({email,password});
      if(error) throw error;
      closeModal();
    }
  }catch(e){ authMsg(e.message||'Something went wrong. Please try again.'); }
  finally{ btn.disabled=false; }
}

async function signInWithGoogle(){
  if(location.protocol==='file:'){ authMsg('Google login needs the app to be opened from a web address (e.g. GitHub Pages or http://localhost) — not a file:// path.'); return; }
  const {error}=await sb.auth.signInWithOAuth({provider:'google',options:{redirectTo:appUrl()}});
  if(error) authMsg(error.message);
}

async function forgotPassword(){
  const email=document.getElementById('auth-email').value.trim();
  if(!email){ authMsg('Enter your email above first.'); return; }
  const {error}=await sb.auth.resetPasswordForEmail(email,{redirectTo:appUrl()});
  if(error) authMsg(error.message); else authMsg('Password reset link sent — check your inbox.',true);
}

function openNewPasswordModal(){
  openModal(`<h3>🔑 Set a new password</h3><div class="m-sub">Choose a new password for your account.</div>
    <form onsubmit="event.preventDefault();saveNewPassword()">
      <input class="searchbox auth-input" id="auth-newpass" type="password" required minlength="8" autocomplete="new-password" placeholder="At least 8 characters">
      <div id="auth-msg" class="auth-msg"></div>
      <div class="m-actions"><button type="submit" class="btn pri" id="auth-newpass-btn">Update password</button></div>
    </form>`);
}
async function saveNewPassword(){
  const password=document.getElementById('auth-newpass').value;
  const {error}=await sb.auth.updateUser({password});
  if(error){ authMsg(error.message); return; }
  closeModal(); toast('Password updated','','🔑');
}

function openAccountModal(){
  const p=peProfile||{};
  openModal(`<h3>👤 ${esc(p.display_name||'Your account')}</h3>
    <div class="m-sub">${esc(peUser.email||'')} · ${syncStatusLabel()}</div>
    <div class="m-actions" style="justify-content:flex-start;flex-wrap:wrap">
      <button class="btn pri" id="acct-sync-btn" onclick="closeModal();syncNow(true)">🔄 Sync now</button>
      <button class="btn ghost" id="acct-lb-btn" onclick="closeModal();go('leaderboard')">🏆 Leaderboard</button>
      <button class="btn ghost" id="acct-settings-btn" onclick="closeModal();go('settings')">⚙️ Account settings</button>
      ${p.is_admin?`<a class="btn ghost" id="acct-admin-btn" href="admin.html" style="text-decoration:none">🛠️ Admin panel</a>`:''}
    </div>
    <div class="m-actions" style="justify-content:flex-start;flex-wrap:wrap;margin-top:6px">
      <button class="btn ghost" id="acct-logout-btn" onclick="signOut(false)">Sign out</button>
      <button class="btn danger" id="acct-logout-clear-btn" onclick="signOut(true)">Sign out &amp; clear this device</button>
    </div>
    <div class="auth-foot">Use “clear this device” on shared or college computers. Your progress stays safe in your account.</div>`);
}

async function signOut(clearDevice){
  if(peUser){ clearTimeout(syncTimer); await syncNow(); }   // flush pending changes first
  await sb.auth.signOut();
  closeModal();
  if(clearDevice){
    S=clone(DEFAULT_STATE); resetShadow();
    applyingRemote=true; save(); applyingRemote=false;
    try{ localStorage.removeItem(SYNC_META_KEY); }catch(e){}
    toast('Signed out and cleared this device','','🧹');
  }else toast('Signed out — progress kept on this device','','👋');
  render();
}

/* ---------- topbar chip ---------- */
function renderAccountChip(){
  const el=document.getElementById('acct-chip');
  if(!el) return;
  if(!cloudConfigured()){ el.style.display='none'; return; }
  el.style.display='';
  if(!sb){ el.innerHTML='<span class="ico">☁️</span><span>Offline</span>'; el.title='Cloud unavailable (offline or blocked)'; return; }
  if(!peUser){ el.innerHTML='<span class="ico">👤</span><span>Log in</span>'; el.title='Log in to sync your progress'; return; }
  const name=(peProfile&&peProfile.display_name)||peUser.email||'You';
  const av=peProfile&&peProfile.avatar_url
    ? `<img class="acct-av" src="${esc(peProfile.avatar_url)}" alt="" referrerpolicy="no-referrer">`
    : `<span class="acct-av acct-av-txt">${esc(name.trim().charAt(0).toUpperCase()||'?')}</span>`;
  el.innerHTML=`${av}<span class="acct-name">${esc(name.split(' ')[0])}</span><span class="sync-dot ${syncStatus}"></span>`;
  el.title=syncStatusLabel();
}
function setSyncStatus(s){ syncStatus=s; renderAccountChip(); const l=document.getElementById('set-sync-label'); if(l) l.textContent=syncStatusLabel(); }
function syncStatusLabel(){
  const meta=readMeta();
  return ({off:'Not syncing', idle:'Ready to sync', syncing:'Syncing…', ok:'All changes synced', error:'Sync failed — will retry', offline:'Offline — will sync when back online'})[syncStatus]
    + (meta.at&&syncStatus==='ok'?` · ${timeAgo(meta.at)}`:'');
}

/* ============================================================
   SYNC ENGINE
   One `progress` row per user holding the whole state.
   Optimistic concurrency via `version`:
     1. Fast path: UPDATE … WHERE version = lastSyncedVersion.
     2. Conflict:  fetch remote, merge per entry, retry.
   ============================================================ */
function readMeta(){ try{ return JSON.parse(localStorage.getItem(SYNC_META_KEY))||{}; }catch(e){ return {}; } }
function writeMeta(m){ try{ localStorage.setItem(SYNC_META_KEY, JSON.stringify({...m, at:Date.now()})); }catch(e){} }

/** What goes to the cloud: everything except device-only settings. */
function cloudState(st){ const {settings, ...rest}=st; return rest; }

function scheduleSync(delay=SYNC_DEBOUNCE_MS){
  if(!sb||!peUser||applyingRemote) return;
  clearTimeout(syncTimer);
  syncTimer=setTimeout(()=>syncNow(), delay);
}

async function syncNow(manual=false){
  if(!sb||!peUser) return;
  if(!navigator.onLine){ setSyncStatus('offline'); return; }
  if(syncing){ syncAgain=true; return; }
  syncing=true; setSyncStatus('syncing');
  const uid=peUser.id;
  try{
    for(let attempt=0; attempt<4; attempt++){
      const meta=readMeta();
      const sameOwner=meta.userId===uid;

      // 1) Fast path — nobody else wrote since our last sync.
      if(sameOwner && meta.version>0){
        const {data,error}=await sb.from('progress')
          .update({state:cloudState(S), version:meta.version+1, streak:streaks().cur})
          .eq('user_id',uid).eq('version',meta.version).select('version');
        if(error) throw error;
        if(data&&data.length){ writeMeta({userId:uid, version:meta.version+1}); break; }
      }

      // 2) Fetch remote.
      const {data:row,error:selErr}=await sb.from('progress').select('state,version').eq('user_id',uid).maybeSingle();
      if(selErr) throw selErr;
      if(!row){
        const {error:insErr}=await sb.from('progress').insert({user_id:uid, state:cloudState(S), version:1, streak:streaks().cur});
        if(insErr && insErr.code!=='23505') throw insErr;   // 23505 = someone inserted first → loop
        if(!insErr){ writeMeta({userId:uid, version:1}); break; }
        continue;
      }
      const remote=row.state||{};
      const remoteEmpty=!Object.keys(remote).length;

      // 3) Decide the new local state.
      if(meta.userId && !sameOwner){
        // Local data belongs to ANOTHER account (shared device) → never mix; take this account's data.
        if(!remoteEmpty) applyRemoteState(remote); else { S=clone({...DEFAULT_STATE, settings:S.settings}); resetShadow(); applyRemoteState(cloudState(S)); }
        writeMeta({userId:uid, version:row.version});
        toast('Loaded your account progress','','☁️');
        break;
      }
      const merged=remoteEmpty?cloudState(S):mergeStates(cloudState(S), remote);
      if(!statesEqual(merged, cloudState(S))) applyRemoteState(merged);
      if(statesEqual(merged, remote)){ writeMeta({userId:uid, version:row.version}); break; }

      // 4) Push merged result guarded by the version we just read.
      const {data:upd,error:updErr}=await sb.from('progress')
        .update({state:cloudState(S), version:row.version+1, streak:streaks().cur})
        .eq('user_id',uid).eq('version',row.version).select('version');
      if(updErr) throw updErr;
      if(upd&&upd.length){ writeMeta({userId:uid, version:row.version+1}); break; }
      // lost the race → loop and merge again
    }
    setSyncStatus('ok');
    if(manual) toast('Progress synced','','☁️');
  }catch(e){
    console.warn('sync failed',e);
    setSyncStatus(navigator.onLine?'error':'offline');
    if(manual) toast('Sync failed: '+esc(e.message||'network error'),'','⚠️');
    clearTimeout(syncTimer); syncTimer=setTimeout(()=>syncNow(), 30000);   // retry later
  }finally{
    syncing=false;
    if(syncAgain){ syncAgain=false; scheduleSync(500); }
  }
}

/** Overwrite the server copy with local state (used after Import / Reset). */
async function forcePush(){
  if(!sb||!peUser) return;
  clearTimeout(syncTimer);
  try{
    const {data:row}=await sb.from('progress').select('version').eq('user_id',peUser.id).maybeSingle();
    const v=row?row.version:0;
    const q=row
      ? sb.from('progress').update({state:cloudState(S), version:v+1, streak:streaks().cur}).eq('user_id',peUser.id).eq('version',v).select('version')
      : sb.from('progress').insert({user_id:peUser.id, state:cloudState(S), version:1, streak:streaks().cur}).select('version');
    const {data,error}=await q;
    if(error) throw error;
    if(data&&data.length) writeMeta({userId:peUser.id, version:data[0].version}); else await syncNow();
    setSyncStatus('ok');
  }catch(e){ console.warn('force push failed',e); setSyncStatus('error'); }
}

function applyRemoteState(st){
  applyingRemote=true;
  try{
    S={...clone(DEFAULT_STATE), ...clone(st), settings:S.settings};
    if(!('xpMigrated' in st)) S.xpMigrated=false;
    migrateXp(); syncXp(); resetShadow();
    save();
  }finally{ applyingRemote=false; }
  render();
}

function statesEqual(a,b){ return stableStringify(a)===stableStringify(b); }
function stableStringify(v){
  if(v===null||typeof v!=='object') return JSON.stringify(v);
  if(Array.isArray(v)) return '['+v.map(stableStringify).join(',')+']';
  return '{'+Object.keys(v).filter(k=>v[k]!==undefined).sort().map(k=>JSON.stringify(k)+':'+stableStringify(v[k])).join(',')+'}';
}

/* ---------- merge (pure function) ---------- */
/** Drop everything older than `cut` (used when the OTHER device reset its progress). */
function keepAfterReset(st, cut){
  const keep=o=>Object.fromEntries(Object.entries(o||{}).filter(([,v])=>(v&&v.u||0)>=cut));
  const keepTs=o=>Object.fromEntries(Object.entries(o||{}).filter(([,ts])=>(+ts||0)>=cut));
  return {...st, topics:keep(st.topics), problems:keep(st.problems), achievements:keepTs(st.achievements),
    sprint:keepTs(st.sprint), activity:(st.activity||[]).filter(a=>(a.t||0)>=cut), days:{}, bonusXp:0};
}
function mergeEntries(a={}, b={}){
  const out={};
  for(const k of new Set([...Object.keys(a),...Object.keys(b)])){
    const x=a[k], y=b[k];
    if(!x||!y){ out[k]=clone(x||y); continue; }
    const win=(x.u||0)>=(y.u||0)?x:y;                       // last write wins per entry…
    out[k]={...clone(win), rev:Math.max(x.rev||0, y.rev||0)}; // …but revisions never go backwards
  }
  return out;
}
function mergeStates(local, remote){
  let l=local||{}, r=remote||{};
  const lr=l.resetAt||0, rr=r.resetAt||0;
  if(lr>rr) r=keepAfterReset(r, lr); else if(rr>lr) l=keepAfterReset(l, rr);

  const days={};
  for(const k of new Set([...Object.keys(l.days||{}),...Object.keys(r.days||{})])){
    const x=(l.days||{})[k]||{xp:0,items:[]}, y=(r.days||{})[k]||{xp:0,items:[]};
    days[k]={xp:Math.max(x.xp||0, y.xp||0), items:[...new Set([...(x.items||[]),...(y.items||[])])].slice(0,40)};
  }
  const achievements={...(r.achievements||{})};
  for(const [k,ts] of Object.entries(l.achievements||{})) achievements[k]=achievements[k]?Math.min(achievements[k],ts):ts;
  const seen=new Set();
  const activity=[...(l.activity||[]),...(r.activity||[])]
    .filter(a=>{ const key=a.t+'|'+a.label; if(seen.has(key)) return false; seen.add(key); return true; })
    .sort((a,b)=>b.t-a.t).slice(0,60);

  return {
    ...r, ...l,                                   // unknown/new fields: local wins
    topics:mergeEntries(l.topics, r.topics),
    problems:mergeEntries(l.problems, r.problems),
    sprint:{...(r.sprint||{}), ...(l.sprint||{})},
    days, achievements, activity,
    bonusXp:Math.max(l.bonusXp||0, r.bonusXp||0),
    xpMigrated:true,
    resetAt:Math.max(lr, rr)||undefined,
  };
}

/* ============================================================
   AI · all Groq calls go through the "ai" Edge Function
   ============================================================ */
class AIError extends Error {}
async function callAI(feature, input){
  if(!sb) throw new AIError(cloudConfigured()?'Cannot reach the cloud right now — check your internet.':'Milo AI is not set up yet (see supabase/SETUP.md).');
  if(!peUser){ openAuthModal('login'); throw new AIError('Please log in to use Milo AI 🐾'); }
  const {data,error}=await sb.functions.invoke('ai',{body:{feature,input}});
  if(error){
    let msg='Milo could not connect right now. Please try again.';
    try{ const body=await error.context.json(); if(body&&body.error) msg=body.error; }catch(e){}
    throw new AIError(msg);
  }
  return (data&&data.text)||'';
}

/* ============================================================
   CONTENT · admin-published syllabus/companies (applied next load)
   ============================================================ */
async function refreshContent(){
  if(!sb) return;
  try{
    const cached=JSON.parse(localStorage.getItem(CONTENT_CACHE_KEY)||'null');
    const {data:head,error}=await sb.from('content').select('updated_at').eq('id','main').maybeSingle();
    if(error||!head) return;                                 // nothing published yet → bundled data.js
    if(cached&&cached.updated_at===head.updated_at) return;
    const {data:row,error:e2}=await sb.from('content').select('data,updated_at').eq('id','main').single();
    if(e2||!row) return;
    localStorage.setItem(CONTENT_CACHE_KEY, JSON.stringify(row));
    toast('New questions &amp; topics available — <a href="javascript:location.reload()" style="color:var(--accent);font-weight:800">refresh</a>','','🆕');
  }catch(e){ console.warn('content refresh failed',e); }
}

/* ============================================================
   SETTINGS · account section (rendered inside vSettings)
   ============================================================ */
function accountSettingsHtml(){
  if(!cloudConfigured()) return `<div class="card" style="margin-bottom:16px">
    <div class="set-row"><div><h4>☁️ Cloud sync &amp; login</h4><p>Not set up on this copy of PlaceEdge. Everything works offline; follow <b>supabase/SETUP.md</b> to enable accounts, sync, leaderboards and Milo AI.</p></div></div></div>`;
  if(!peUser) return `<div class="card" style="margin-bottom:16px">
    <div class="set-row"><div><h4>☁️ Sync across devices</h4><p>Log in to back up your progress to the cloud and continue on any device. Your current progress will be kept.</p></div>
    <button class="btn pri" id="set-login-btn" onclick="openAuthModal('login')">Log in / Sign up</button></div></div>`;
  const p=peProfile||{};
  return `<div class="card" style="margin-bottom:16px">
    <div class="set-row"><div><h4>👤 Signed in</h4><p>${esc(peUser.email||'')} · <span id="set-sync-label">${syncStatusLabel()}</span></p></div>
      <div style="display:flex;gap:8px;flex-wrap:wrap"><button class="btn ghost" id="set-sync-btn" onclick="syncNow(true)">🔄 Sync now</button>
      <button class="btn ghost" id="set-logout-btn" onclick="openAccountModal()">Sign out…</button></div></div>
    <div class="set-row"><div><h4>🏷️ Display name</h4><p>Shown on leaderboards.</p></div>
      <div style="display:flex;gap:8px"><input class="searchbox" id="set-name" maxlength="40" style="width:180px" value="${esc(p.display_name||'')}">
      <button class="btn pri" id="set-name-btn" onclick="saveDisplayName()">Save</button></div></div>
    <div class="set-row"><div><h4>🏆 Show me on the global leaderboard</h4><p>Friends in your groups can always see you.</p></div>
      <div class="switch ${p.show_on_leaderboard!==false?'on':''}" id="set-lb-switch" onclick="toggleLeaderboardVisibility()"></div></div>
  </div>`;
}
async function saveDisplayName(){
  const v=(document.getElementById('set-name').value||'').trim().slice(0,40);
  if(!v){ toast('Name cannot be empty','','⚠️'); return; }
  const {error}=await sb.from('profiles').update({display_name:v}).eq('id',peUser.id);
  if(error){ toast('Could not save name: '+esc(error.message),'','⚠️'); return; }
  peProfile={...peProfile, display_name:v}; renderAccountChip(); toast('Name updated','','🏷️');
}
async function toggleLeaderboardVisibility(){
  const next=!(peProfile&&peProfile.show_on_leaderboard!==false);
  const {error}=await sb.from('profiles').update({show_on_leaderboard:next}).eq('id',peUser.id);
  if(error){ toast('Could not update: '+esc(error.message),'','⚠️'); return; }
  peProfile={...peProfile, show_on_leaderboard:next}; render();
  toast(next?'You are visible on the global leaderboard':'Hidden from the global leaderboard','','🏆');
}

/* ============================================================
   LEADERBOARD VIEW
   ============================================================ */
let lbTab='global', lbGroups=[];
function vLeaderboard(){
  if(!cloudConfigured()) return `<div class="empty card"><div class="big">🏆</div>Leaderboards need the cloud backend. Follow <b>supabase/SETUP.md</b> to enable it.</div>`;
  if(!peUser) return `<div class="empty card"><div class="big">🏆</div><div style="margin-bottom:14px">Log in to compare XP with friends and students everywhere.</div>
    <button class="btn pri" id="lb-login-btn" onclick="openAuthModal('login')">Log in / Sign up</button></div>`;
  setTimeout(loadLeaderboard,0);
  return `<div class="card" style="margin-bottom:16px;display:flex;gap:12px;align-items:center;flex-wrap:wrap;justify-content:space-between">
      <div><b>🏆 XP Leaderboard</b><div style="font-size:12px;color:var(--muted)">XP is verified on the server from your solved problems &amp; mastered topics.</div></div>
      <div style="display:flex;gap:8px;flex-wrap:wrap">
        <button class="btn ghost" id="lb-join-btn" onclick="openJoinGroup()">🔑 Join group</button>
        <button class="btn pri" id="lb-create-btn" onclick="openCreateGroup()">＋ Create group</button>
      </div></div>
    <div class="tabs" id="lb-tabs"></div>
    <div id="lb-body"><div class="card lb-loading">Loading leaderboard…</div></div>`;
}
async function loadLeaderboard(){
  if(!sb||!peUser) return;
  if(syncStatus!=='ok') await syncNow();                     // make sure our own row is fresh
  const {data:groups}=await sb.rpc('my_groups');
  lbGroups=groups||[];
  if(lbTab!=='global' && !lbGroups.some(g=>g.id===lbTab)) lbTab='global';
  const tabs=document.getElementById('lb-tabs');
  if(!tabs) return;                                          // user navigated away
  tabs.innerHTML=`<button class="${lbTab==='global'?'active':''}" onclick="lbTab='global';loadLeaderboard()">🌍 Global</button>`
    + lbGroups.map(g=>`<button class="${lbTab===g.id?'active':''}" onclick="lbTab='${g.id}';loadLeaderboard()">👥 ${esc(g.name)}</button>`).join('');
  const {data:rows,error}=lbTab==='global'
    ? await sb.rpc('leaderboard_global',{p_limit:50})
    : await sb.rpc('leaderboard_group',{p_group:lbTab});
  const body=document.getElementById('lb-body');
  if(!body) return;
  if(error){ body.innerHTML=`<div class="card" style="color:var(--rose)">Could not load leaderboard: ${esc(error.message)}</div>`; return; }
  const g=lbGroups.find(x=>x.id===lbTab);
  const groupBar=g?`<div class="card lb-group-bar">
      <div><b>${esc(g.name)}</b> · ${g.members} member${g.members==1?'':'s'}<div style="font-size:12px;color:var(--muted)">Invite friends with this code</div></div>
      <div style="display:flex;gap:8px;align-items:center;flex-wrap:wrap">
        <span class="lb-code" id="lb-code">${esc(g.code)}</span>
        <button class="mini-btn" id="lb-copy-btn" onclick="copyGroupCode('${esc(g.code)}')">Copy</button>
        <button class="mini-btn" id="lb-leave-btn" onclick="leaveGroup('${g.id}')">Leave</button>
      </div></div>`:'';
  const medal=r=>r==1?'🥇':r==2?'🥈':r==3?'🥉':'#'+r;
  body.innerHTML=groupBar+`<div class="card lb-list">${(rows||[]).map(r=>`
      <div class="lb-row ${r.is_me?'me':''}">
        <div class="lb-rank">${medal(r.rank)}</div>
        ${r.avatar_url?`<img class="acct-av" src="${esc(r.avatar_url)}" alt="" referrerpolicy="no-referrer">`:`<span class="acct-av acct-av-txt">${esc((r.display_name||'?').charAt(0).toUpperCase())}</span>`}
        <div class="lb-name">${esc(r.display_name)}${r.is_me?' <span class="lb-you">YOU</span>':''}<div class="lb-meta">Level ${r.level} · 🔥 ${r.streak} day streak · ✅ ${r.solved} solved</div></div>
        <div class="lb-xp">${r.xp.toLocaleString()} <small>XP</small></div>
      </div>`).join('')||'<div class="empty"><div class="big">🌱</div>No one here yet — be the first!</div>'}</div>`;
}
function openCreateGroup(){
  openModal(`<h3>👥 Create a study group</h3><div class="m-sub">Get an invite code to share with friends. Only members see the group leaderboard.</div>
    <form onsubmit="event.preventDefault();createGroup()"><input class="searchbox auth-input" id="grp-name" maxlength="40" required placeholder="e.g. CSE-B Placement Squad">
    <div id="auth-msg" class="auth-msg"></div>
    <div class="m-actions"><button type="button" class="btn ghost" onclick="closeModal()">Cancel</button><button type="submit" class="btn pri" id="grp-create-submit">Create</button></div></form>`);
  setTimeout(()=>document.getElementById('grp-name').focus(),60);
}
async function createGroup(){
  const {data,error}=await sb.rpc('create_group',{p_name:document.getElementById('grp-name').value});
  if(error){ authMsg(error.message); return; }
  const g=data&&data[0]; closeModal();
  if(g){ lbTab=g.id; toast(`Group created — invite code <b>${esc(g.code)}</b>`,'','👥'); }
  loadLeaderboard();
}
function openJoinGroup(){
  openModal(`<h3>🔑 Join a group</h3><div class="m-sub">Enter the 6-character code your friend shared.</div>
    <form onsubmit="event.preventDefault();joinGroup()"><input class="searchbox auth-input" id="grp-code" maxlength="6" required placeholder="A1B2C3" style="text-transform:uppercase;letter-spacing:3px;font-weight:800">
    <div id="auth-msg" class="auth-msg"></div>
    <div class="m-actions"><button type="button" class="btn ghost" onclick="closeModal()">Cancel</button><button type="submit" class="btn pri" id="grp-join-submit">Join</button></div></form>`);
  setTimeout(()=>document.getElementById('grp-code').focus(),60);
}
async function joinGroup(){
  const {data,error}=await sb.rpc('join_group',{p_code:document.getElementById('grp-code').value});
  if(error){ authMsg(error.message); return; }
  const g=data&&data[0]; closeModal();
  if(g){ lbTab=g.id; toast(`Joined ${esc(g.name)}`,'','🎉'); confetti(); }
  loadLeaderboard();
}
async function leaveGroup(id){
  if(!confirm('Leave this group?')) return;
  const {error}=await sb.rpc('leave_group',{p_group:id});
  if(error){ toast('Could not leave: '+esc(error.message),'','⚠️'); return; }
  lbTab='global'; toast('Left the group','','👋'); loadLeaderboard();
}
function copyGroupCode(code){
  (navigator.clipboard?navigator.clipboard.writeText(code):Promise.reject())
    .then(()=>toast('Invite code copied','','📋'))
    .catch(()=>toast('Code: '+esc(code),'','📋'));
}
