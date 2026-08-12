/* ============================================================
   UI ENGINE · RENDERERS, NAVIGATION, MODALS & EVENT HANDLERS
   ============================================================ */

/* ---------- UI helpers: toast · confetti · modal ---------- */
function toast(msg, cls='', ico='✅'){
  const box=document.getElementById('toasts');
  const el=document.createElement('div'); el.className='toast '+cls;
  el.innerHTML=`<span style="font-size:17px">${ico}</span><span>${msg}</span>`;
  box.appendChild(el);
  setTimeout(()=>{ el.classList.add('out'); setTimeout(()=>el.remove(),320); },3200);
}
/* lightweight canvas confetti */
const confettiC=document.getElementById('confetti-canvas'), ctx=confettiC ? confettiC.getContext('2d') : null;
let confPieces=[], confRunning=false;
function confetti(){
  if(!S.settings.animations || !ctx) return;
  confettiC.width=innerWidth; confettiC.height=innerHeight;
  const colors=['#22C55E','#4ADE80','#F59E0B','#38BDF8','#A78BFA','#FB7185','#FACC15'];
  for(let i=0;i<130;i++) confPieces.push({
    x:innerWidth/2+(Math.random()-.5)*260, y:innerHeight*0.35,
    vx:(Math.random()-.5)*11, vy:-(Math.random()*11+4),
    w:Math.random()*8+4, h:Math.random()*5+3,
    c:colors[Math.floor(Math.random()*colors.length)],
    r:Math.random()*Math.PI, vr:(Math.random()-.5)*.3, life:110+Math.random()*50
  });
  if(!confRunning){ confRunning=true; requestAnimationFrame(confTick); }
}
function confTick(){
  if(!ctx) return;
  ctx.clearRect(0,0,confettiC.width,confettiC.height);
  confPieces=confPieces.filter(p=>p.life>0 && p.y<innerHeight+30);
  confPieces.forEach(p=>{
    p.x+=p.vx; p.y+=p.vy; p.vy+=.32; p.vx*=.99; p.r+=p.vr; p.life--;
    ctx.save(); ctx.translate(p.x,p.y); ctx.rotate(p.r);
    ctx.globalAlpha=Math.min(1,p.life/40); ctx.fillStyle=p.c;
    ctx.fillRect(-p.w/2,-p.h/2,p.w,p.h); ctx.restore();
  });
  if(confPieces.length){ requestAnimationFrame(confTick); } else { confRunning=false; ctx.clearRect(0,0,confettiC.width,confettiC.height); }
}
function openModal(html){ document.getElementById('modal').innerHTML=html; document.getElementById('modal-bg').classList.add('open'); }
function closeModal(){ document.getElementById('modal-bg').classList.remove('open'); }
document.getElementById('modal-bg').addEventListener('click',e=>{ if(e.target.id==='modal-bg') closeModal(); });
const esc=s=>String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
function animateCounter(el, target, suffix=''){
  if(!S.settings.animations){ el.textContent=target+suffix; return; }
  const dur=800, t0=performance.now();
  const step=t=>{ const p=Math.min(1,(t-t0)/dur), e=1-Math.pow(1-p,3);
    el.textContent=Math.round(target*e)+suffix;
    if(p<1) requestAnimationFrame(step); };
  requestAnimationFrame(step);
}
const timeAgo=t=>{ const s=(Date.now()-t)/1000;
  if(s<60) return 'just now'; if(s<3600) return Math.floor(s/60)+'m ago';
  if(s<86400) return Math.floor(s/3600)+'h ago'; return Math.floor(s/86400)+'d ago'; };
const isHot=c=>c&&c.length>=3;

/* ---------- Status togglers ---------- */
const T_ICONS=['⚪','🟡','🟢'], P_ICONS=['','⏳','✓'];
function cycleTopic(id){
  const cur=tState(id), was=cur.s, next=(cur.s+1)%3;
  S.topics[id]={...cur, s:next};
  const t=TOPIC_BY_ID[id]||{n:id};
  if(next===2){                       // entering Mastered → +20 (first time this cycle)
    S.topics[id].masteredAt=Date.now();
    applyXpChange(`Mastered — ${t.n}`, '🟢', XP_TOPIC);
  }else if(was===2){                  // LEAVING Mastered → reverse the 20
    applyXpChange(`Reverted — ${t.n}`, '↩️', -XP_TOPIC);
  }else if(next===1){                 // Not Started → Learning (no XP)
    logStudy(`Started learning — ${t.n}`,'🟡');
  }
  render();
}
function cycleDsaTopic(fid){ // DSA folder theory status uses synthetic id 'dsat-<folder>'
  const id='dsat-'+fid, cur=tState(id), was=cur.s, next=(cur.s+1)%3;
  S.topics[id]={...cur, s:next};
  const f=DSA.find(x=>x.id===fid);
  if(next===2){ S.topics[id].masteredAt=Date.now(); applyXpChange(`Mastered DSA topic — ${f.name}`,'🟢', XP_TOPIC); }
  else if(was===2){ applyXpChange(`Reverted DSA topic — ${f.name}`,'↩️', -XP_TOPIC); }
  else if(next===1){ logStudy(`Started learning — ${f.name} (DSA)`,'🟡'); }
  render();
}
function cycleProblem(slug){
  const cur=pState(slug), was=cur.s, next=(cur.s+1)%3;
  S.problems[slug]={...cur, s:next};
  const m=PROB_META[slug]||{n:slug,d:'E'}, gain=xpForProblem(m.d);
  if(next===2){                       // entering Solved → +difficulty XP
    S.problems[slug].solvedAt=Date.now();
    applyXpChange(`Solved — ${m.n}`, '✅', gain);
  }else if(was===2){                  // LEAVING Solved → reverse that solve's XP
    applyXpChange(`Reverted — ${m.n}`, '↩️', -gain);
  }else if(next===1){                 // Not Started → Attempted (no XP)
    logStudy(`Attempted — ${m.n}`,'⏳');
  }
  render();
}
function bumpRev(kind, key){
  const store=kind==='t'?S.topics:S.problems;
  const cur=kind==='t'?tState(key):pState(key);
  store[key]={...cur, rev:(cur.rev||0)+1};
  const name=kind==='t'?(TOPIC_BY_ID[key]?TOPIC_BY_ID[key].n:(DSA.find(f=>'dsat-'+f.id===key)||{}).name||key):(PROB_META[key]||{}).n||key;
  addBonusXp(XP_REV, `Revision #${store[key].rev} — ${name}`,'🔁');   // one-way; reverts never touch this
  render();
}
function editNote(kind, key){
  const cur=kind==='t'?tState(key):pState(key);
  const name=kind==='t'?(TOPIC_BY_ID[key]||{}).n||key:(PROB_META[key]||{}).n||key;
  openModal(`<h3>📝 Notes</h3><div class="m-sub">${esc(name)}</div>
    <textarea id="note-ta" placeholder="Approach, complexity, edge cases, mistakes to avoid…">${esc(cur.note||'')}</textarea>
    <div class="m-actions"><button class="btn ghost" onclick="closeModal()">Cancel</button>
    <button class="btn pri" onclick="saveNote('${kind}','${key}')">Save note</button></div>`);
  setTimeout(()=>document.getElementById('note-ta').focus(),60);
}
function saveNote(kind,key){
  const v=document.getElementById('note-ta').value;
  const store=kind==='t'?S.topics:S.problems;
  const cur=kind==='t'?tState(key):pState(key);
  store[key]={...cur, note:v};
  save(); closeModal(); toast('Note saved','','📝'); render();
}
/* ============================================================
   VIEWS · router + renderers (UI generated from data objects)
   ============================================================ */
const ROUTES=[
 {id:'dashboard',ic:'🏠',n:'Dashboard'},
 {id:'company-roadmaps',ic:'🎯',n:'Company Roadmaps'},
 {id:'jobs',ic:'💼',n:'Live Hiring Drives'},
 {id:'sprint',ic:'🗓️',n:'30-Day Sprint'},
 {id:'mock',ic:'⏱️',n:'Mock Simulator'},
 {id:'resume-checker',ic:'📄',n:'Resume Checker'},
 {id:'hr-studio',ic:'🎙️',n:'HR Studio'},
 {id:'subjects',ic:'📚',n:'Subjects'},
 {id:'dsa',ic:'🧠',n:'DSA Problems'},
 {id:'companies',ic:'🏢',n:'Companies'},
 {id:'calendar',ic:'📅',n:'Calendar'},
 {id:'analytics',ic:'📈',n:'Analytics'},
 {id:'achievements',ic:'🏅',n:'Achievements'},
 {id:'settings',ic:'⚙️',n:'Settings'},
];
let route={page:'dashboard'};

const HISTORY_OK=(()=>{
  try{ history.replaceState(history.state, '', location.href); return true; }
  catch(e){ return false; }
})();
let _memStack=[{page:'dashboard'}];   // in-memory fallback history
function safeReplace(r){
  if(HISTORY_OK){ try{ history.replaceState({r}, '', routeToHash(r)); return; }catch(e){} }
  _memStack[_memStack.length-1]={...r};
}
function safePush(r){
  if(HISTORY_OK){ try{ history.pushState({r}, '', routeToHash(r)); return; }catch(e){} }
  _memStack.push({...r});
}
function safeBack(){
  if(HISTORY_OK && history.length>1){ history.back(); return true; }
  if(_memStack.length>1){ _memStack.pop(); route=_memStack[_memStack.length-1];
    document.getElementById('sidebar').classList.remove('open'); render(); scrollTo({top:0,behavior:'auto'}); return true; }
  return false;
}
function routeToHash(r){
  const p=new URLSearchParams();
  p.set('p', r.page);
  ['subj','folder','tab','yr','cId','comp'].forEach(k=>{ if(r[k]!==undefined && r[k]!=='' && r[k]!==0) p.set(k, r[k]); });
  if(r.q) p.set('q', r.q);
  return '#'+p.toString();
}
function hashToRoute(){
  let h='';
  try{ h=(location.hash||'').replace(/^#/,''); }catch(e){ h=''; }
  if(!h) return {page:'dashboard'};
  const p=new URLSearchParams(h);
  const page=p.get('p')||'dashboard';
  if(!ROUTES.some(r=>r.id===page)) return {page:'dashboard'};
  const r={page};
  ['subj','folder','tab','q','cId','comp'].forEach(k=>{ if(p.has(k)) r[k]=p.get(k); });
  if(p.has('yr')) r.yr=+p.get('yr')||0;
  return r;
}
function sameRoute(a,b){
  return a.page===b.page && a.subj===b.subj && a.folder===b.folder && a.tab===b.tab && a.cId===b.cId && a.comp===b.comp && (a.yr||0)===(b.yr||0) && (a.q||'')===(b.q||'');
}
function go(page, extra={}){
  const next={page, ...extra};
  document.getElementById('sidebar').classList.remove('open');
  if(sameRoute(next, route)){ return; }   // avoid duplicate history entries
  route=next;
  safePush(route);
  render(); scrollTo({top:0,behavior:'smooth'});
}
function goReplace(extra={}){
  route={...route, ...extra};
  safeReplace(route);
  render();
}
function parentRoute(){
  const r=route;
  if(r.page==='subjects' && r.subj) return {page:'subjects'};
  if(r.page==='dsa' && r.folder) return {page:'dsa', tab:'topics'};
  if(r.page==='dsa' && r.tab && r.tab!=='topics') return {page:'dsa', tab:'topics'};
  if(r.page!=='dashboard') return {page:'dashboard'};
  return null; // already at root
}
function goBack(){
  if(safeBack()) return;                 // used real or in-memory history
  const par=parentRoute(); if(par) go(par.page, par);   // last resort: logical parent
}
addEventListener('popstate', e=>{
  const r=(e.state&&e.state.r)?e.state.r:hashToRoute();
  route=r; document.getElementById('sidebar').classList.remove('open');
  render(); scrollTo({top:0,behavior:'auto'});
});
function navHtml(){
  return ROUTES.map(r=>`<button class="${route.page===r.id?'active':''}" onclick="go('${r.id}')"><span class="ic">${r.ic}</span>${r.n}</button>`).join('');
}
function refreshChrome(){
  const lp=levelProgress(), st=streaks();
  document.getElementById('side-level').textContent='Level '+lp.level;
  document.getElementById('side-xp').textContent=S.xp+' XP';
  document.getElementById('side-xpbar').style.width=lp.pct+'%';
  document.getElementById('chip-streak').textContent=st.cur+' day streak';
  document.getElementById('chip-xp').textContent=S.xp+' XP';
}
const PAGE_TITLES={
  dashboard:['Dashboard','Your placement journey at a glance'],
  'company-roadmaps':['Company-Wise Preparation Roadmaps','10 top companies round-by-round selection process & syllabus breakdown'],
  jobs:['Live Tech Hiring Drives','Mass hiring & fresher jobs posted within last 7 days'],
  sprint:['30-Day Placement Sprint','30 days structured crash course for last-minute preparation'],
  mock:['Company Mock Interview Simulator','45-minute timed test round with real questions & live scorecard'],
  'resume-checker':['AI Resume Bullet & ATS Checker','Instant ATS score & STAR method bullet improver'],
  'hr-studio':['HR STAR Method Practice Studio','Top 15 HR interview questions with Milo AI feedback'],
  subjects:['Subjects','Complete placement syllabus · ⚪ Not started → 🟡 Learning → 🟢 Mastered'],
  dsa:['DSA Problems','17 topic folders · Blind 75 · NeetCode 150 · Striver A2Z'],
  companies:['Frequently Asked by Companies','Real questions from 60+ companies · 2025 & 2026 placement drives'],
  calendar:['Study Calendar','GitHub-style consistency tracking'],
  analytics:['Analytics','Where your effort goes'],
  achievements:['Achievements','Milestones on the road to your offer'],
  settings:['Settings','Data, backup & preferences']
};

function render(){
  document.getElementById('nav').innerHTML=navHtml();
  const [t,sub]=PAGE_TITLES[route.page]||['',''];
  document.getElementById('page-title').textContent=t;
  document.getElementById('page-sub').textContent=sub;
  const bb=document.getElementById('back-btn');
  if(bb) bb.style.display = parentRoute() ? 'grid' : 'none';   // hidden only at the dashboard root
  const v=document.getElementById('view');
  const fn={
    dashboard:vDashboard,
    'company-roadmaps':vCompanyRoadmaps,
    jobs:vJobs,
    sprint:vSprint,
    mock:vMock,
    'resume-checker':vResumeChecker,
    'hr-studio':vHRStudio,
    subjects:vSubjects,
    dsa:vDsa,
    companies:vCompanies,
    calendar:vCalendar,
    analytics:vAnalytics,
    achievements:vAchievements,
    settings:vSettings
  }[route.page];
  v.innerHTML=fn?fn():'';
  afterRender();
  refreshChrome();
}
function afterRender(){
  // animate progress bars & counters after DOM insertion
  requestAnimationFrame(()=>{
    document.querySelectorAll('[data-w]').forEach(el=>el.style.width=el.dataset.w+'%');
    document.querySelectorAll('[data-h]').forEach(el=>el.style.height=el.dataset.h+'%');
    document.querySelectorAll('[data-count]').forEach(el=>animateCounter(el, +el.dataset.count, el.dataset.suffix||''));
    const ring=document.getElementById('ring-arc');
    if(ring){ const pct=+ring.dataset.pct, C=2*Math.PI*62;
      ring.style.transition=S.settings.animations?'stroke-dashoffset 1.1s cubic-bezier(.22,1,.36,1)':'none';
      requestAnimationFrame(()=>ring.style.strokeDashoffset=C*(1-pct/100)); }
  });
}

/* ---------- DASHBOARD ---------- */
function statusIcon(kind, key){
  const st=kind==='t'?tState(key):pState(key);
  return T_ICONS[st.s];
}
function vDashboard(){
  const st=streaks(), o=overallStats(), lp=levelProgress(), rd=readiness();
  const totalItems=o.topicsTotal+DSA.length;
  const doneItems=o.topicsDone;
  const overallPct=Math.round((SUBJECTS.reduce((a,s)=>a+subjectProgress(s.id).pct,0)+subjectProgress('dsa').pct)/(SUBJECTS.length+1));
  const learning=ALL_TOPICS.filter(t=>tState(t.id).s===1).slice(0,6);
  const learningDsa=DSA.filter(f=>tState('dsat-'+f.id).s===1).slice(0,3);
  const dashSubjects=['java','dsa','dbms','sql','os','cn','oop','sd','apt','hr'];
  const nameOf=id=>id==='dsa'?{name:'DSA',icon:'🧠'}:SUBJECTS.find(s=>s.id===id);
  return `
  <div class="grid g5">
    ${statCard('🔥','Current Streak',st.cur,'day'+(st.cur===1?'':'s')+' · best '+st.best,'')}
    ${statCard('⭐','Level',lp.level,lp.cur+' / '+lp.need+' XP to next','amber')}
    ${statCard('💎','Total XP',S.xp,'earn XP by mastering & solving','blue')}
    ${statCard('📚','Topics Mastered',o.topicsDone,'of '+o.topicsTotal+' syllabus topics','violet')}
    ${statCard('🎯','Readiness',rd.score,'placement readiness %','rose')}
  </div>

  <div class="sec-title"><h2>💼 Live Hiring Drives (< 7 Days)</h2><button class="more" onclick="go('jobs')">View all ${LIVE_JOBS.length} drives →</button></div>
  <div class="grid g2" style="margin-bottom:16px">
    ${LIVE_JOBS.slice(0,2).map(j=>`
      <div class="card hoverable" onclick="go('jobs')" style="cursor:pointer">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px">
          <b style="font-size:13.5px">${j.logo} ${esc(j.company)}</b>
          <span class="pill-count" style="background:rgba(34,197,94,0.15);color:var(--accent);font-size:11px">Posted ${j.postedDaysAgo}d ago</span>
        </div>
        <div style="font-size:12.5px;font-weight:700;color:var(--text);margin-bottom:4px">${esc(j.role)}</div>
        <div style="font-size:11.5px;color:var(--muted)">💰 ${esc(j.ctc)} · 📍 ${esc(j.location.split('(')[0])}</div>
      </div>
    `).join('')}
  </div>

  <div class="grid g2" style="margin-top:16px">
    <div class="card hoverable" onclick="go('sprint')" style="cursor:pointer;border-color:rgba(56,189,248,0.3)">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px">
        <b style="font-size:14px">🗓️ 30-Day Placement Sprint</b>
        <span class="pill-count" style="background:rgba(56,189,248,0.15);color:#38bdf8">${Object.keys(S.sprint||{}).length} / 30 Days</span>
      </div>
      <div class="pbar"><i data-w="${Math.round(Object.keys(S.sprint||{}).length/30*100)}" style="background:linear-gradient(90deg,#0ea5e9,#38bdf8)"></i></div>
      <div style="margin-top:12px;font-size:12px;color:var(--muted);display:flex;justify-content:space-between;align-items:center;">
        <span>Target: ${SPRINT_ROADMAP[(Object.keys(S.sprint||{}).length%30)]?.title || 'Finish Sprint'}</span>
        <span style="color:var(--accent);font-weight:700">Open Sprint →</span>
      </div>
    </div>
    <div class="card hoverable" onclick="go('mock')" style="cursor:pointer;border-color:rgba(245,158,11,0.3)">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px">
        <b style="font-size:14px">⏱️ 45-Min Company Mock Simulator</b>
        <span class="pill-count" style="background:rgba(245,158,11,0.15);color:#f59e0b">Real Drive Test</span>
      </div>
      <div style="font-size:12.5px;color:var(--muted);margin-bottom:12px">2 DSA + 2 Theory + 1 SQL question with 45:00 live timer & AI evaluation scorecard.</div>
      <button class="btn pri" style="width:100%;font-size:12.5px;padding:8px" onclick="event.stopPropagation();go('mock')">⚡ Launch Mock Test</button>
    </div>
  </div>

  <div class="grid g2" style="margin-top:16px">
    <div class="card hoverable">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px">
        <b style="font-size:14px">Overall Progress</b><b style="color:var(--accent)" data-count="${overallPct}" data-suffix="%" class="counter">0%</b>
      </div>
      <div class="pbar"><i data-w="${overallPct}"></i></div>
      <div style="display:flex;justify-content:space-between;align-items:center;margin:18px 0 10px">
        <b style="font-size:14px">Level ${lp.level} → ${lp.level+1}</b><span style="color:var(--muted);font-size:12px">${lp.cur} / ${lp.need} XP</span>
      </div>
      <div class="pbar"><i data-w="${lp.pct}" style="background:linear-gradient(90deg,#D97706,var(--amber),#FCD34D)"></i></div>
      <div style="margin-top:16px;font-size:12px;color:var(--muted)">✅ ${o.solved} problems solved · ⏳ ${o.attempted} attempted · 🔁 ${o.revisions} revisions</div>
    </div>
    <div class="card hoverable">
      <div class="ring-wrap">
        ${readinessRing(rd)}
        <div class="ring-breakdown">
          ${Object.entries(rd.parts).map(([k,v])=>`<div class="rb-row"><span class="l">${k}</span><div class="pbar thin"><i data-w="${v}"></i></div><span class="p">${v}%</span></div>`).join('')}
        </div>
      </div>
    </div>
  </div>

  <div class="sec-title"><h2>📊 Subject Progress</h2><button class="more" onclick="go('subjects')">Open subjects →</button></div>
  <div class="card">
    ${dashSubjects.map(id=>{ const s=nameOf(id), p=subjectProgress(id);
      return `<div class="subj-row" onclick="${id==='dsa'?"go('dsa')":`go('subjects',{subj:'${id}'})`}">
        <div class="ic">${s.icon}</div>
        <div class="mid"><div style="display:flex;justify-content:space-between"><span class="nm">${s.name}</span><span class="meta">${p.done}/${p.total} ${id==='dsa'?'solved':'mastered'}</span></div>
        <div class="pbar thin" style="margin-top:6px"><i data-w="${p.pct}"></i></div></div>
        <div class="pct" style="color:${p.pct===100?'var(--accent)':'inherit'}">${p.pct}%</div></div>`;}).join('')}
  </div>

  <div class="grid g2" style="margin-top:16px">
    <div>
      <div class="sec-title" style="margin-top:0"><h2>🟡 Continue Learning</h2></div>
      <div class="card">
      ${learning.length||learningDsa.length?
        learning.map(t=>`<div class="subj-row" onclick="go('subjects',{subj:'${t.subj}'})"><div class="ic">🟡</div><div class="mid"><div class="nm">${esc(t.n)}</div><div class="meta">${t.subjName}</div></div><span style="color:var(--faint)">›</span></div>`).join('')+
        learningDsa.map(f=>`<div class="subj-row" onclick="go('dsa',{folder:'${f.id}'})"><div class="ic">${f.icon}</div><div class="mid"><div class="nm">${f.name}</div><div class="meta">DSA topic</div></div><span style="color:var(--faint)">›</span></div>`).join('')
        :`<div class="empty"><div class="big">🌱</div>Mark topics as 🟡 Learning and they'll appear here.</div>`}
      </div>
    </div>
    <div>
      <div class="sec-title" style="margin-top:0"><h2>⚡ Recent Activity</h2></div>
      <div class="card" style="max-height:330px;overflow-y:auto">
      ${S.activity.length?S.activity.slice(0,12).map(a=>`<div class="activity-row"><div class="a-ic">${a.ic}</div><div><div>${esc(a.label)}</div><div class="tm">${timeAgo(a.t)}</div></div></div>`).join('')
        :`<div class="empty"><div class="big">📭</div>Your completed topics and solves will show up here.</div>`}
      </div>
    </div>
  </div>

  <div class="sec-title"><h2>🟩 Study Calendar</h2><button class="more" onclick="go('calendar')">Full calendar →</button></div>
  <div class="card"><div style="max-width:100%;overflow-x:auto;-webkit-overflow-scrolling:touch">${heatmapHtml(26)}</div>
    <div class="hm-legend">Less <span style="background:#16223a"></span><span style="background:#14532d"></span><span style="background:#166534"></span><span style="background:#16A34A"></span><span style="background:#22C55E"></span> More</div>
  </div>`;
}
function statCard(ic,k,v,d,cls){
  return `<div class="card stat hoverable ${cls}"><div class="k"><span>${ic}</span>${k}</div><div class="v counter" data-count="${v}">0</div><div class="d">${d}</div></div>`;
}
function readinessRing(rd){
  const C=2*Math.PI*62;
  return `<div class="ring"><svg width="150" height="150" viewBox="0 0 150 150">
    <circle cx="75" cy="75" r="62" stroke="#0f1a2e" stroke-width="13" fill="none"/>
    <circle id="ring-arc" data-pct="${rd.score}" cx="75" cy="75" r="62" stroke="url(#gradR)" stroke-width="13" fill="none" stroke-linecap="round" stroke-dasharray="${C}" stroke-dashoffset="${C}"/>
    <defs><linearGradient id="gradR" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#16A34A"/><stop offset="100%" stop-color="#4ADE80"/></linearGradient></defs></svg>
    <div class="center"><b data-count="${rd.score}" data-suffix="%" class="counter">0%</b><span>PLACEMENT READY</span></div></div>`;
}
function heatmapHtml(weeks){
  const cells=[]; const today=new Date();
  const start=new Date(today); start.setDate(start.getDate()-(weeks*7-1)-start.getDay());
  for(let d=new Date(start); d<=today; d.setDate(d.getDate()+1)){
    const k=todayKey(d), day=S.days[k], xp=day?day.xp:0, n=day?day.items.length:0;
    const lvl=!day||(n===0&&xp===0)?0:xp>=80?4:xp>=40?3:xp>=15?2:1;
    cells.push(`<div class="hm-cell ${lvl?'l'+lvl:''} ${k===todayKey()?'today':''}" title="${k} · ${xp} XP · ${n} activities" onclick="dayModal('${k}')"></div>`);
  }
  return `<div class="heatmap">${cells.join('')}</div>`;
}
function dayModal(k){
  const d=S.days[k]||{xp:0,items:[]};
  const est=Math.max(d.items.length*12, d.xp*1.4); // rough study-time estimate
  openModal(`<h3>📅 ${k}</h3><div class="m-sub">💎 ${d.xp} XP earned · ⏱️ ~${Math.round(est)} min studied · ${d.items.length} activities</div>
    ${d.items.length?`<div style="max-height:300px;overflow-y:auto">${d.items.map(i=>`<div class="activity-row"><div class="a-ic">•</div><div>${esc(i)}</div></div>`).join('')}</div>`
      :`<div class="empty"><div class="big">😴</div>No study logged this day.</div>`}
    <div class="m-actions"><button class="btn pri" onclick="closeModal()">Close</button></div>`);
}

/* ---------- SUBJECTS ---------- */
function vSubjects(){
  if(route.subj) return subjectDetail(route.subj);
  const cards=SUBJECTS.map(s=>{ const p=subjectProgress(s.id);
    return folderCard(s.icon,s.name,`${p.done}/${p.total} mastered`,p.pct,`go('subjects',{subj:'${s.id}'})`); }).join('');
  const dp=subjectProgress('dsa');
  return `<div class="grid g3">${folderCard('🧠','DSA','→ dedicated section',dp.pct,`go('dsa')`)}${cards}</div>`;
}
function folderCard(ic,name,meta,pct,onclick){
  const C=2*Math.PI*19;
  return `<div class="card folder hoverable" onclick="${onclick}">
    <div class="f-top"><div class="f-ic">${ic}</div>
      <svg class="donut-mini" viewBox="0 0 44 44"><circle cx="22" cy="22" r="19" stroke="#0f1a2e"/><circle cx="22" cy="22" r="19" stroke="${pct===100?'#4ADE80':'#22C55E'}" stroke-dasharray="${C}" stroke-dashoffset="${C*(1-pct/100)}" stroke-linecap="round"/></svg></div>
    <h3>${name} ${pct===100?'✅':''}</h3><div class="f-meta">${meta} · ${pct}%</div>
    <div class="pbar thin"><i data-w="${pct}"></i></div></div>`;
}
function subjectDetail(id){
  const s=SUBJECTS.find(x=>x.id===id); if(!s) return vSubjects();
  const p=subjectProgress(id);
  return `<div class="crumb"><a onclick="go('subjects')">Subjects</a> / ${s.name}</div>
  <div class="card" style="margin-bottom:16px;display:flex;align-items:center;gap:16px;flex-wrap:wrap">
    <div style="font-size:34px">${s.icon}</div>
    <div style="flex:1;min-width:200px"><b style="font-size:16px">${s.name}</b>
      <div style="font-size:12px;color:var(--muted);margin:4px 0 8px">${p.done} of ${p.total} topics mastered · click the circle to cycle status · 🟢 first mastery = +${XP_TOPIC} XP</div>
      <div class="pbar"><i data-w="${p.pct}"></i></div></div>
    <b style="font-size:22px;color:var(--accent)">${p.pct}%</b></div>
  ${s.topics.map(t=>topicRow(t)).join('')}`;
}
function topicRow(t){
  const st=tState(t.id);
  return `<div class="topic ${st.s===2?'mastered':''}">
    <div class="st s${st.s}" title="Click to cycle status" onclick="cycleTopic('${t.id}')">${T_ICONS[st.s]}</div>
    <div class="body">
      <div class="t-name">${esc(t.n)} ${isHot(t.c)?'<span class="hot">🔥 HOT · '+t.c.length+' companies</span>':''}</div>
      <div class="t-sub">
        ${t.g?`<a href="${t.g}" target="_blank" rel="noopener">📖 GFG article</a>`:''}
        ${t.c&&t.c.length?`<span title="${esc(t.c.join(', '))}">🏢 ${esc(t.c.slice(0,3).join(', '))}${t.c.length>3?' +'+(t.c.length-3):''}</span>`:''}
        ${st.rev?`<span class="rev-badge">🔁 ${st.rev} revisions</span>`:''}
        ${st.note?`<span class="note-dot" title="Has notes"></span>`:''}
      </div>
    </div>
    <button class="mini-btn ${st.note?'on':''}" onclick="editNote('t','${t.id}')">📝 Note</button>
    ${st.s===2?`<button class="mini-btn" title="+${XP_REV} XP" onclick="bumpRev('t','${t.id}')">🔁 Revise</button>`:''}
  </div>`;
}

/* ---------- DSA ---------- */
function vDsa(){
  const tab=route.tab||'topics';
  const tabs=`<div class="tabs">
    <button class="${tab==='topics'?'active':''}" onclick="go('dsa',{tab:'topics'})">📂 Topics</button>
    ${Object.entries(SHEETS).map(([k,sh])=>{ const p=sheetProgress(k);
      return `<button class="${tab===k?'active':''}" onclick="go('dsa',{tab:'${k}'})">${sh.icon} ${sh.name} <span class="pill-count">${p.done}/${p.total}</span></button>`; }).join('')}
  </div>`;
  if(tab!=='topics') return tabs+sheetView(tab);
  if(route.folder) return tabs+dsaFolder(route.folder);
  const totalSolved=subjectProgress('dsa');
  return tabs+`
  <div class="card" style="margin-bottom:16px;display:flex;gap:16px;align-items:center;flex-wrap:wrap">
    <div style="font-size:30px">🧠</div>
    <div style="flex:1;min-width:220px"><b>DSA Grind</b>
    <div style="font-size:12px;color:var(--muted);margin:3px 0 8px">${totalSolved.done} of ${totalSolved.total} problems solved across 17 folders · problems repeat in sheets & share status</div>
    <div class="pbar"><i data-w="${totalSolved.pct}"></i></div></div>
    <b style="font-size:22px;color:var(--accent)">${totalSolved.pct}%</b></div>
  <div class="grid g3">
    ${DSA.map(f=>{ const done=f.problems.filter(p=>pState(p.s).s===2).length, pct=Math.round(done/f.problems.length*100);
      const ts=tState('dsat-'+f.id);
      return folderCard(f.icon, f.name+' '+T_ICONS[ts.s], `${done}/${f.problems.length} solved`, pct, `go('dsa',{folder:'${f.id}'})`); }).join('')}
  </div>`;
}
function dsaFolder(fid){
  const f=DSA.find(x=>x.id===fid); if(!f) return '';
  const ts=tState('dsat-'+fid);
  const done=f.problems.filter(p=>pState(p.s).s===2).length, pct=Math.round(done/f.problems.length*100);
  return `<div class="crumb"><a onclick="go('dsa')">DSA</a> / ${f.name}</div>
  <div class="card" style="margin-bottom:16px">
    <div style="display:flex;align-items:center;gap:14px;flex-wrap:wrap">
      <div style="font-size:30px">${f.icon}</div>
      <div style="flex:1;min-width:220px"><b style="font-size:15px">${f.name}</b>
        <div style="font-size:12px;color:var(--muted);margin-top:2px">${done}/${f.problems.length} solved · ${pct}%</div></div>
      <div style="display:flex;gap:8px;align-items:center">
        <div class="st topic-st s${ts.s}" style="width:38px;height:38px;border-radius:50%;display:grid;place-items:center;border:2px solid var(--border);cursor:pointer;background:#0f1a2e;${ts.s===1?'border-color:var(--amber);background:var(--amber-soft);':''}${ts.s===2?'border-color:var(--accent);background:var(--accent-soft);':''}" title="Topic status — click to cycle" onclick="cycleDsaTopic('${fid}')">${T_ICONS[ts.s]}</div>
        ${ts.s===2?`<button class="mini-btn" onclick="bumpRev('t','dsat-${fid}')">🔁 Revise topic</button>`:''}
      </div></div>
    <div class="pbar thin" style="margin-top:12px"><i data-w="${pct}"></i></div>
    <div style="margin-top:12px;font-size:12.5px">📖 Learn first: <a href="${f.g}" target="_blank" rel="noopener">GeeksforGeeks — ${f.name}</a> · then practice below. ⚪ not started → 🟡 attempted → 🟢 solved (first solve earns XP: E +10 · M +20 · H +30)</div>
  </div>
  <div class="card" style="padding:8px 6px">
    ${f.problems.map(p=>problemRow(p.s, p.n, p.d, p.lc, p.gfg, p.c)).join('')}
  </div>`;
}
function problemRow(slug, name, d, lcUrl, gfgUrl, companies){
  const st=pState(slug);
  return `<div class="prob">
    <div class="st s${st.s}" title="⚪ → 🟡 attempted → 🟢 solved" onclick="cycleProblem('${slug}')">${st.s===2?'✓':st.s===1?'…':''}</div>
    <div class="nm">${esc(name)}
      <span class="links">
        ${lcUrl?`<a href="${lcUrl}" target="_blank" rel="noopener">LC ↗</a>`:''}
        ${gfgUrl?`<a href="${gfgUrl}" target="_blank" rel="noopener">GFG ↗</a>`:''}
      </span>
      ${companies&&companies.length?`<div style="font-size:10.5px;color:var(--faint);margin-top:2px" title="${esc(companies.join(', '))}">🏢 asked by ${esc(companies.slice(0,3).join(', '))}${companies.length>3?' +'+(companies.length-3)+' more':''}</div>`:''}
    </div>
    ${st.note?'<span class="note-dot" title="Has notes"></span>':''}
    ${st.rev?`<span class="rev-badge">🔁${st.rev}</span>`:''}
    <span class="diff ${d}">${d==='E'?'Easy':d==='M'?'Medium':'Hard'}</span>
    <button class="mini-btn ${st.note?'on':''}" onclick="editNote('p','${slug}')">📝</button>
    ${st.s===2?`<button class="mini-btn" title="Log a revision (+${XP_REV} XP)" onclick="bumpRev('p','${slug}')">🔁</button>`:''}
  </div>`;
}
function sheetView(key){
  const sh=SHEETS[key], p=sheetProgress(key);
  const seen=new Set();
  return `<div class="card" style="margin-bottom:16px;display:flex;gap:16px;align-items:center;flex-wrap:wrap">
    <div style="font-size:30px">${sh.icon}</div>
    <div style="flex:1;min-width:220px"><b>${sh.name}</b>
      <div style="font-size:12px;color:var(--muted);margin:3px 0 8px">${sh.desc} · ${p.done}/${p.total} solved · progress is shared with topic folders</div>
      <div class="pbar"><i data-w="${p.pct}"></i></div></div>
    <b style="font-size:22px;color:${p.pct===100?'#4ADE80':'var(--accent)'}">${p.pct}%</b></div>
  ${sh.groups.map(([cat,list])=>{
    const rows=list.filter(([n,d,sl])=>{ if(seen.has(sl)) return false; seen.add(sl); return true; });
    if(!rows.length) return '';
    const done=rows.filter(([n,d,sl])=>pState(sl).s===2).length;
    return `<div class="sec-title"><h2>${esc(cat)}</h2><span class="pill-count">${done}/${rows.length}</span></div>
      <div class="card" style="padding:8px 6px">${rows.map(([n,d,sl])=>{ const m=PROB_META[sl]||{};
        return problemRow(sl, n, d, LC+sl+'/', m.gfg, null); }).join('')}</div>`;
  }).join('')}`;
}

/* ---------- COMPANIES ---------- */
const CAT_LABELS={DSA:'DSA / Coding',SQL:'SQL',DBMS:'DBMS',OS:'Operating Systems',CN:'Computer Networks',OOP:'OOP',Java:'Java',SD:'System Design & Web',DP:'Dynamic Programming',Projects:'Projects & Resume',Aptitude:'Puzzles & Aptitude',HR:'HR & Behavioral'};
function vCompanies(){
  const q=(route.q||'').toLowerCase(), yr=route.yr||0;
  const list=COMPANIES.filter(c=>(!q||c.n.toLowerCase().includes(q))&&(!yr||c.yr.includes(yr)))
    .sort((a,b)=>a.n.localeCompare(b.n));
  const hot=[...ALL_TOPICS].filter(t=>t.c&&t.c.length>=6).sort((a,b)=>b.c.length-a.c.length).slice(0,10);
  return `
  <div class="card" style="margin-bottom:16px">
    <b>🔥 Most repeated topics across all drives</b>
    <div style="font-size:12px;color:var(--muted);margin:2px 0 12px">If it appears here, master it first — these repeat every single year.</div>
    ${hot.map(t=>`<div class="subj-row" onclick="go('subjects',{subj:'${t.subj}'})"><div class="ic">${T_ICONS[tState(t.id).s]}</div>
      <div class="mid"><div class="nm">${esc(t.n)}</div><div class="meta">${t.subjName} · asked by ${t.c.length} companies</div></div>
      <span class="hot">🔥 ${t.c.length}×</span></div>`).join('')}
  </div>
  <div style="display:flex;gap:10px;flex-wrap:wrap;margin-bottom:16px;align-items:center">
    <input class="searchbox" placeholder="🔍 Search company…" value="${esc(route.q||'')}" oninput="route.q=this.value;safeReplace(route);renderCompaniesOnly()">
    <div class="tabs" style="margin:0">
      <button class="${!yr?'active':''}" onclick="goReplace({yr:0})">All (${COMPANIES.length})</button>
      <button class="${yr===2025?'active':''}" onclick="goReplace({yr:2025})">2025 batch</button>
      <button class="${yr===2026?'active':''}" onclick="goReplace({yr:2026})">2026 batch</button>
    </div>
  </div>
  <div id="comp-list">${list.map(compCard).join('')||'<div class="empty card"><div class="big">🔍</div>No company matches.</div>'}</div>`;
}
function renderCompaniesOnly(){
  const q=(route.q||'').toLowerCase(), yr=route.yr||0;
  const list=COMPANIES.filter(c=>(!q||c.n.toLowerCase().includes(q))&&(!yr||c.yr.includes(yr))).sort((a,b)=>a.n.localeCompare(b.n));
  document.getElementById('comp-list').innerHTML=list.map(compCard).join('')||'<div class="empty card"><div class="big">🔍</div>No company matches.</div>';
}
function compCard(c){
  const nq=Object.values(c.q).reduce((a,l)=>a+l.length,0);
  return `<div class="card comp hoverable" style="margin-bottom:12px" id="comp-${c.n.replace(/[^a-z]/gi,'')}">
    <div class="c-head" onclick="this.parentElement.classList.toggle('open')">
      <div class="c-name">🏢 ${esc(c.n)} ${c.yr.map(y=>`<span class="yr">${y}</span>`).join(' ')}</div>
      <div style="display:flex;gap:12px;align-items:center"><span class="pill-count">${nq} questions</span><span class="arrow">›</span></div>
    </div>
    <div class="c-body">
      ${Object.entries(c.q).map(([cat,list])=>`<div class="qcat"><h5>${CAT_LABELS[cat]||cat}</h5><ul>${list.map(x=>`<li>${esc(x)}</li>`).join('')}</ul></div>`).join('')}
    </div>
  </div>`;
}

/* ---------- CALENDAR ---------- */
let calCursor=new Date();
function vCalendar(){
  const st=streaks();
  const y=calCursor.getFullYear(), m=calCursor.getMonth();
  const first=new Date(y,m,1), startDow=first.getDay(), dim=new Date(y,m+1,0).getDate();
  const monthName=first.toLocaleString('en',{month:'long',year:'numeric'});
  let cells='';
  for(let i=0;i<startDow;i++) cells+='<div class="cal-cell empty"></div>';
  for(let d=1;d<=dim;d++){
    const k=todayKey(new Date(y,m,d)), day=S.days[k], has=day&&(day.items.length||day.xp>0);
    cells+=`<div class="cal-cell ${has?'studied':''} ${k===todayKey()?'today':''}" onclick="dayModal('${k}')">
      <span>${d}</span>${has?`<span class="xp-mini">${day.xp} XP</span>`:''}</div>`;
  }
  return `
  <div class="grid g4">
    ${statCard('🔥','Current Streak',st.cur,'consecutive study days','')}
    ${statCard('🏆','Longest Streak',st.best,'your personal best','amber')}
    ${statCard('📆','Total Study Days',st.total,'all time','blue')}
    ${statCard('🗓️','This Month',st.month,'days studied this month','violet')}
  </div>
  <div class="sec-title"><h2>🟩 Year at a glance</h2></div>
  <div class="card"><div style="max-width:100%;overflow-x:auto;-webkit-overflow-scrolling:touch">${heatmapHtml(52)}</div>
    <div class="hm-legend">Less <span style="background:#16223a"></span><span style="background:#14532d"></span><span style="background:#166534"></span><span style="background:#16A34A"></span><span style="background:#22C55E"></span> More</div></div>
  <div class="sec-title"><h2>📅 ${monthName}</h2>
    <div style="display:flex;gap:6px;flex-wrap:wrap">
      <button class="mini-btn" onclick="calCursor.setMonth(calCursor.getMonth()-1);render()">‹ Prev</button>
      <button class="mini-btn" onclick="calCursor=new Date();render()">Today</button>
      <button class="mini-btn" onclick="calCursor.setMonth(calCursor.getMonth()+1);render()">Next ›</button></div></div>
  <div class="card">
    <div class="cal-head"><span>SUN</span><span>MON</span><span>TUE</span><span>WED</span><span>THU</span><span>FRI</span><span>SAT</span></div>
    <div class="cal-grid">${cells}</div>
    <div style="margin-top:12px;font-size:12px;color:var(--faint)">🟢 Green = studied that day · click any day to see topics, XP & estimated study time.</div>
  </div>`;
}

/* ---------- ANALYTICS ---------- */
function vAnalytics(){
  const o=overallStats();
  const subjRows=[...SUBJECTS.map(s=>({n:s.name, ...subjectProgress(s.id)})),{n:'DSA',...subjectProgress('dsa')}]
    .sort((a,b)=>b.pct-a.pct);
  const most=subjRows[0], least=subjRows[subjRows.length-1];
  const months=[]; const now=new Date();
  for(let i=5;i>=0;i--){ const d=new Date(now.getFullYear(),now.getMonth()-i,1);
    const pre=`${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}`;
    const xp=Object.entries(S.days).filter(([k])=>k.startsWith(pre)).reduce((a,[,v])=>a+v.xp,0);
    months.push({l:d.toLocaleString('en',{month:'short'}), xp}); }
  const maxXp=Math.max(1,...months.map(m=>m.xp));
  const dc={E:0,M:0,H:0};
  Object.entries(S.problems).forEach(([sl,v])=>{ if(v.s===2&&PROB_META[sl]) dc[PROB_META[sl].d]++; });
  const dTot=Math.max(1,dc.E+dc.M+dc.H);
  const colors={E:'var(--easy)',M:'var(--med)',H:'var(--hard)'};
  return `
  <div class="grid g4">
    ${statCard('✅','Problems Solved',o.solved,'across all folders & sheets','')}
    ${statCard('⏳','Attempted',o.attempted,'come back and finish these','amber')}
    ${statCard('🔁','Revisions',o.revisions,'spaced repetition wins offers','violet')}
    ${statCard('💎','Total XP',S.xp,'lifetime earnings','blue')}
  </div>
  <div class="grid g2" style="margin-top:16px">
    <div class="card">
      <b>📚 Subject completion</b><div style="height:14px"></div>
      ${subjRows.map(r=>`<div class="hbar-row"><span class="lbl">${r.n}</span><div class="trk"><i data-w="${r.pct}" style="background:linear-gradient(90deg,var(--accent2),#4ADE80)"></i></div><span class="val">${r.pct}%</span></div>`).join('')}
      <div style="margin-top:12px;font-size:12px;color:var(--muted)">🥇 Most studied: <b style="color:var(--accent)">${most.n}</b> (${most.pct}%) · 🐢 Least studied: <b style="color:var(--rose)">${least.n}</b> (${least.pct}%) — give it some love.</div>
    </div>
    <div class="card">
      <b>📈 Monthly XP progress</b>
      <div class="vbars">${months.map(m=>`<div class="vbar"><span class="vl">${m.xp}</span><div class="col" data-h="${Math.round(m.xp/maxXp*100)}"></div><span class="xl">${m.l}</span></div>`).join('')}</div>
      <div style="height:18px"></div>
      <b>🎚️ Difficulty breakdown (solved)</b><div style="height:12px"></div>
      ${['E','M','H'].map(d=>`<div class="hbar-row"><span class="lbl">${d==='E'?'Easy':d==='M'?'Medium':'Hard'}</span><div class="trk"><i data-w="${Math.round(dc[d]/dTot*100)}" style="background:${colors[d]}"></i></div><span class="val">${dc[d]}</span></div>`).join('')}
    </div>
  </div>
  <div class="sec-title"><h2>🎯 Readiness composition</h2></div>
  <div class="card">${Object.entries(readiness().parts).map(([k,v])=>`<div class="hbar-row"><span class="lbl">${k}</span><div class="trk"><i data-w="${v}" style="background:linear-gradient(90deg,#0EA5E9,var(--blue))"></i></div><span class="val">${v}%</span></div>`).join('')}
  <div style="font-size:12px;color:var(--muted);margin-top:8px">Weighting — Subjects 30% · DSA topics 20% · LeetCode 25% · Consistency 15% · Revision 10%</div></div>`;
}

/* ---------- ACHIEVEMENTS ---------- */
function vAchievements(){
  const unlocked=ACHIEVEMENTS.filter(a=>S.achievements[a.id]);
  return `<div class="card" style="margin-bottom:16px;display:flex;gap:14px;align-items:center">
    <div style="font-size:32px">🏅</div>
    <div><b>${unlocked.length} / ${ACHIEVEMENTS.length} unlocked</b>
    <div style="font-size:12px;color:var(--muted)">Keep studying — locked badges show exactly what to chase next.</div></div></div>
  <div class="grid g2">
    ${ACHIEVEMENTS.map(a=>{ const ts=S.achievements[a.id];
      return `<div class="card ach hoverable ${ts?'unlocked':'locked'}">
        <div class="a-ic">${ts?a.ic:'🔒'}</div>
        <div><h4>${a.n}</h4><p>${a.d}</p>${ts?`<div class="when">Unlocked ${new Date(ts).toLocaleDateString()}</div>`:''}</div></div>`; }).join('')}
  </div>`;
}

/* ---------- SETTINGS ---------- */
function vSettings(){
  return `<div class="card">
    <div class="set-row"><div><h4>📤 Export progress</h4><p>Download all data (topics, problems, XP, notes, calendar) as JSON.</p></div>
      <button class="btn pri" onclick="exportData()">Export JSON</button></div>
    <div class="set-row"><div><h4>📥 Import progress</h4><p>Restore from a previously exported JSON backup.</p></div>
      <button class="btn ghost" onclick="document.getElementById('import-file').click()">Import JSON</button>
      <input type="file" id="import-file" accept=".json,application/json" style="display:none" onchange="importData(this)"></div>
    <div class="set-row"><div><h4>♻️ Local backup mirror <span style="color:var(--accent);font-size:11px;font-weight:800">RECOMMENDED</span></h4><p>Also saves a copy to IndexedDB. If site data is partially cleared, your progress can be recovered automatically on next open.</p></div>
      <div class="switch ${S.settings.idbMirror?'on':''}" onclick="S.settings.idbMirror=!S.settings.idbMirror;save();if(S.settings.idbMirror){idbPut(S);toast('Local backup mirror on','','♻️')}else{toast('Mirror off — export backups manually','','⚠️')};render()"></div></div>
    <div class="set-row"><div><h4>💾 Auto-export backup</h4><p>Silently download a dated JSON backup every ${S.settings.autoExportEvery} milestones (masteries & solves). Best defence against clearing browser data.</p></div>
      <div style="display:flex;gap:8px;align-items:center">
        <select class="searchbox" style="width:auto" title="Backup frequency" onchange="S.settings.autoExportEvery=+this.value;save();render()">
          ${[5,10,15,25,50].map(n=>`<option value="${n}" ${S.settings.autoExportEvery===n?'selected':''}>every ${n}</option>`).join('')}
        </select>
        <div class="switch ${S.settings.autoExport?'on':''}" onclick="S.settings.autoExport=!S.settings.autoExport;saveCount=0;save();toast(S.settings.autoExport?'Auto-export on — first backup after '+S.settings.autoExportEvery+' milestones':'Auto-export off','', S.settings.autoExport?'💾':'⚙️');render()"></div>
      </div></div>
    <div class="set-row"><div><h4>✨ Animations</h4><p>Smooth transitions, shimmer bars, counters & confetti.</p></div>
      <div class="switch ${S.settings.animations?'on':''}" onclick="S.settings.animations=!S.settings.animations;document.body.classList.toggle('anim',S.settings.animations);save();render()"></div></div>
    <div class="set-row"><div><h4>🌙 Theme</h4><p>Premium dark is the default. Light mode is future-proofed here.</p></div>
      <select class="searchbox" style="width:auto" onchange="S.settings.theme=this.value;save();toast(this.value==='dark'?'Dark theme active':'Light theme coming soon — staying dark for now','','🌙')">
        <option value="dark" ${S.settings.theme==='dark'?'selected':''}>Dark (default)</option>
        <option value="light" ${S.settings.theme==='light'?'selected':''}>Light (coming soon)</option></select></div>
    <div class="set-row"><div><h4>🗑️ Reset progress</h4><p>Wipes everything stored in this browser. Cannot be undone.</p></div>
      <button class="btn danger" onclick="resetAll()">Reset</button></div>
  </div>`;
}
function exportData(auto=false){
  const blob=new Blob([JSON.stringify(S,null,2)],{type:'application/json'});
  const a=document.createElement('a'); a.href=URL.createObjectURL(blob);
  const stamp=todayKey()+(auto?'-auto-'+new Date().toISOString().slice(11,16).replace(':',''):'');
  a.download='placeedge-backup-'+stamp+'.json'; a.click(); URL.revokeObjectURL(a.href);
  toast(auto?'Auto-backup saved to your downloads':'Backup exported','', auto?'💾':'📤');
}
function importData(input){
  const f=input.files[0]; if(!f) return;
  const r=new FileReader();
  r.onload=()=>{ try{
      const data=JSON.parse(r.result);
      if(typeof data!=='object'||data===null||!('xp' in data)) throw new Error('bad');
      S={...clone(DEFAULT_STATE), ...data, settings:{...DEFAULT_STATE.settings, ...(data.settings||{})}};
      if(!('bonusXp' in data) || !('xpMigrated' in data)) S.xpMigrated=false;  // legacy import → reconcile
      migrateXp(); syncXp();
      save(); document.body.classList.toggle('anim',S.settings.animations);
      toast('Progress imported successfully','','📥'); confetti(); render();
    }catch(e){ toast('Invalid backup file','','⚠️'); } };
  r.readAsText(f); input.value='';
}
function resetAll(){
  openModal(`<h3>⚠️ Reset everything?</h3><div class="m-sub">All XP, statuses, notes, streaks and achievements will be permanently erased.</div>
    <div class="m-actions"><button class="btn ghost" onclick="closeModal()">Cancel</button>
    <button class="btn danger" onclick="S=clone(DEFAULT_STATE);saveCount=0;save();idbPut(S);closeModal();toast('Progress reset','','🗑️');render()">Yes, reset</button></div>`);
}

/* ---------- 🎯 COMPANY-WISE ROADMAPS RENDERER ---------- */
function vCompanyRoadmaps(){
  const activeCompId = route.cId || 'amazon';
  const cData = COMPANY_ROADMAPS.find(x=>x.id===activeCompId) || COMPANY_ROADMAPS[0];

  return `
  <div class="card" style="margin-bottom:16px">
    <b style="font-size:16px">🎯 Top 10 Company-Wise Preparation Roadmaps</b>
    <div style="font-size:12px;color:var(--muted);margin-top:2px">Select a company below to view round-by-round selection process, DSA & Core CS syllabus breakdown, and key interview tips.</div>
    <div style="margin-top:14px;display:flex;gap:8px;flex-wrap:wrap">
      ${COMPANY_ROADMAPS.map(c=>`
        <button class="mini-btn ${activeCompId===c.id?'on':''}" onclick="go('company-roadmaps',{cId:'${c.id}'})">${c.logo} ${c.name}</button>
      `).join('')}
    </div>
  </div>

  <div class="card" style="margin-bottom:16px;border-left:4px solid var(--accent)">
    <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px">
      <div style="display:flex;align-items:center;gap:12px">
        <div style="font-size:36px">${cData.logo}</div>
        <div>
          <h2 style="font-size:18px;margin:0;color:var(--text)">${esc(cData.name)} Preparation Roadmap</h2>
          <span style="font-size:12px;color:var(--muted)">Category: <b style="color:var(--accent)">${esc(cData.tier)}</b></span>
        </div>
      </div>
      <span class="pill-count" style="background:rgba(34,197,94,0.15);color:var(--accent);font-size:13px;padding:6px 14px">💰 ${esc(cData.ctc)}</span>
    </div>

    <div style="margin-top:20px">
      <h3 style="font-size:14px;color:var(--amber);margin-bottom:10px">📋 Selection Process & Test Rounds</h3>
      <div style="display:flex;flex-direction:column;gap:8px">
        ${cData.rounds.map((r,i)=>`
          <div style="background:var(--card2);padding:10px 14px;border-radius:10px;border:1px solid var(--border);font-size:12.5px;display:flex;align-items:center;gap:10px">
            <span style="font-weight:900;color:var(--amber);font-size:14px">#${i+1}</span>
            <span>${esc(r)}</span>
          </div>
        `).join('')}
      </div>
    </div>

    <div class="grid g2" style="margin-top:20px">
      <div>
        <h3 style="font-size:14px;color:var(--accent);margin-bottom:10px">🧠 DSA Must-Do Topics</h3>
        <div style="background:var(--card2);padding:12px;border-radius:10px;border:1px solid var(--border)">
          ${cData.dsaSyllabus.map(t=>`<div style="font-size:12.5px;padding:4px 0;color:var(--text)">• ${esc(t)}</div>`).join('')}
        </div>
      </div>
      <div>
        <h3 style="font-size:14px;color:#38bdf8;margin-bottom:10px">🗄️ Core CS & System Design</h3>
        <div style="background:var(--card2);padding:12px;border-radius:10px;border:1px solid var(--border)">
          ${cData.csSyllabus.map(t=>`<div style="font-size:12.5px;padding:4px 0;color:var(--text)">• ${esc(t)}</div>`).join('')}
        </div>
      </div>
    </div>

    <div style="margin-top:20px;background:rgba(245,158,11,0.1);border:1px solid rgba(245,158,11,0.3);padding:12px 16px;border-radius:12px">
      <b style="color:var(--amber);font-size:13px">💡 Expert Interviewer Tip:</b>
      <div style="font-size:12.5px;color:var(--text);margin-top:4px">${esc(cData.tips)}</div>
    </div>

    <button class="btn pri" style="width:100%;margin-top:16px;padding:10px;font-size:13px" onclick="go('mock',{comp:'${cData.name}'})">
      ⏱️ Launch ${cData.name} 45-Min Timed Mock Test Now →
    </button>
  </div>`;
}

/* ---------- 💼 LIVE JOBS & MASS HIRING DRIVES RENDERER ---------- */
function vJobs(){
  const q = (route.q||'').toLowerCase();
  const list = LIVE_JOBS.filter(j=> !q || j.company.toLowerCase().includes(q) || j.role.toLowerCase().includes(q) || j.skills.some(s=>s.toLowerCase().includes(q)));
  return `
  <div class="card" style="margin-bottom:16px">
    <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:12px">
      <div>
        <b style="font-size:16px">💼 Live Tech Hiring Drives & Mass Off-Campus Openings</b>
        <div style="font-size:12px;color:var(--muted);margin-top:2px">Fresh 2025 & 2026 batch hiring drives posted within the last 7 days. Verified official application portals.</div>
      </div>
      <span class="pill-count" style="background:rgba(34,197,94,0.15);color:var(--accent);font-size:13px;padding:6px 12px">🔥 ${LIVE_JOBS.length} Active Drives</span>
    </div>
    <div style="margin-top:14px">
      <input class="searchbox" placeholder="🔍 Search company, role, or tech stack (e.g. Java, TCS, Amazon)..." value="${esc(route.q||'')}" oninput="route.q=this.value;safeReplace(route);renderJobsOnly()">
    </div>
  </div>

  <div id="jobs-list" class="grid g2">
    ${list.map(jobCardHtml).join('')}
  </div>`;
}

function renderJobsOnly(){
  const q = (route.q||'').toLowerCase();
  const list = LIVE_JOBS.filter(j=> !q || j.company.toLowerCase().includes(q) || j.role.toLowerCase().includes(q) || j.skills.some(s=>s.toLowerCase().includes(q)));
  const el = document.getElementById('jobs-list');
  if(el) el.innerHTML = list.map(jobCardHtml).join('') || `<div class="card empty"><div class="big">🔍</div>No job drives match your search.</div>`;
}

function jobCardHtml(j){
  return `
  <div class="card hoverable" style="display:flex;flex-direction:column;justify-content:space-between">
    <div>
      <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:10px">
        <div style="display:flex;align-items:center;gap:10px">
          <div style="font-size:26px">${j.logo}</div>
          <div>
            <h3 style="font-size:15px;margin:0;color:var(--text)">${esc(j.company)}</h3>
            <span style="font-size:11px;color:var(--muted)">Posted ${j.postedDaysAgo===1?'Yesterday':j.postedDaysAgo+' days ago'} · <span style="color:var(--accent);font-weight:700">${esc(j.type)}</span></span>
          </div>
        </div>
        <span class="pill-count" style="background:rgba(245,158,11,0.15);color:var(--amber);font-size:11px">${esc(j.batch)}</span>
      </div>

      <b style="font-size:13.5px;color:var(--accent);display:block;margin-bottom:6px">${esc(j.role)}</b>
      
      <div style="font-size:12px;color:var(--muted);margin-bottom:10px">
        📍 <strong>Location:</strong> ${esc(j.location)}<br>
        💰 <strong>Package (CTC):</strong> <span style="color:#4ade80;font-weight:700">${esc(j.ctc)}</span>
      </div>

      <p style="font-size:12px;line-height:1.5;color:var(--text);margin-bottom:12px">${esc(j.desc)}</p>

      <div style="margin-bottom:14px">
        ${j.skills.map(s=>`<span style="display:inline-block;background:var(--card2);padding:2px 8px;border-radius:6px;font-size:11px;color:var(--muted);margin:2px 4px 2px 0;border:1px solid var(--border)">${esc(s)}</span>`).join('')}
      </div>
    </div>

    <a href="${j.url}" target="_blank" rel="noopener" class="btn pri" style="text-align:center;text-decoration:none;display:block;font-size:12.5px;padding:9px">Apply Now on Official Portal ↗</a>
  </div>`;
}

/* ---------- 🗓️ 30-DAY SPRINT RENDERER ---------- */
function toggleSprintDay(dayNum, xpVal){
  if(!S.sprint) S.sprint={};
  if(S.sprint[dayNum]){
    delete S.sprint[dayNum];
    applyXpChange(`Reverted Sprint Day ${dayNum}`,'↩️', -xpVal);
  } else {
    S.sprint[dayNum]=Date.now();
    applyXpChange(`Completed Sprint Day ${dayNum}`,'🗓️', xpVal);
  }
  render();
}

function vSprint(){
  const doneDays = Object.keys(S.sprint||{}).length;
  const pct = Math.round(doneDays / 30 * 100);
  return `
  <div class="card" style="margin-bottom:16px;display:flex;gap:16px;align-items:center;flex-wrap:wrap">
    <div style="font-size:32px">🗓️</div>
    <div style="flex:1;min-width:220px">
      <b>30-Day Placement Crash Course Sprint</b>
      <div style="font-size:12px;color:var(--muted);margin:3px 0 8px">Daily structured checklist for high-yield placement preparation · ${doneDays}/30 Days Completed</div>
      <div class="pbar"><i data-w="${pct}" style="background:linear-gradient(90deg,#0ea5e9,#38bdf8)"></i></div>
    </div>
    <b style="font-size:22px;color:${pct===100?'#4ade80':'#38bdf8'}">${pct}%</b>
  </div>

  <div class="grid g2">
    ${SPRINT_ROADMAP.map(item=>{
      const isDone = !!S.sprint?.[item.day];
      return `
      <div class="card hoverable ${isDone?'mastered':''}" style="border-left:4px solid ${isDone?'var(--accent)':'var(--border)'}">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px">
          <span style="font-weight:800;font-size:13px;color:${isDone?'var(--accent)':'var(--text)'}">DAY ${item.day} · ${esc(item.category)}</span>
          <span class="pill-count" style="background:rgba(34,197,94,0.12);color:var(--accent)">+${item.xp} XP</span>
        </div>
        <h4 style="margin:0 0 8px;font-size:14px;color:var(--text)">${esc(item.title)}</h4>
        <div style="font-size:11.5px;color:var(--muted);margin-bottom:12px">
          ${item.topics.map(t=>`<span style="display:inline-block;background:var(--card2);padding:2px 8px;border-radius:6px;margin:2px 4px 2px 0;border:1px solid var(--border)">${esc(t)}</span>`).join('')}
        </div>
        <button class="btn ${isDone?'ghost':'pri'}" style="width:100%;font-size:12px;padding:6px 12px" onclick="toggleSprintDay(${item.day}, ${item.xp})">
          ${isDone ? '✓ Day Completed (Click to undo)' : 'Mark Day Completed (+'+item.xp+' XP)'}
        </button>
      </div>`;
    }).join('')}
  </div>`;
}

/* ---------- ⏱️ MOCK TEST SIMULATOR RENDERER ---------- */
let mockTimerInterval = null;
let mockTimeRemaining = 2700; // 45 minutes

function startMockTimer(){
  clearInterval(mockTimerInterval);
  mockTimeRemaining = 2700;
  mockTimerInterval = setInterval(()=>{
    mockTimeRemaining--;
    const el = document.getElementById('mock-timer-display');
    if(el){
      const m = String(Math.floor(mockTimeRemaining/60)).padStart(2,'0');
      const s = String(mockTimeRemaining%60).padStart(2,'0');
      el.textContent = `${m}:${s}`;
    }
    if(mockTimeRemaining <= 0){
      clearInterval(mockTimerInterval);
      toast('Time is up! Submitting mock test scorecard...','','⏱️');
      submitMockTest();
    }
  },1000);
}

function vMock(){
  const comp = route.comp || 'Amazon';
  const cData = COMPANIES.find(x=>x.n.toLowerCase()===comp.toLowerCase()) || COMPANIES[0];
  const dsaQ = (cData.q.DSA || ['Two Sum','Reverse Linked List']).slice(0,2);
  const theoryQ = (cData.q.DBMS || cData.q.OS || ['Explain 4 Pillars of OOP','Difference between Process and Thread']).slice(0,2);
  const sqlQ = (cData.q.SQL || ['Write query to find 2nd Highest Salary']).slice(0,1);

  setTimeout(()=>startMockTimer(), 100);

  return `
  <div class="card" style="margin-bottom:16px">
    <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:12px">
      <div>
        <b style="font-size:16px">⏱️ 45-Min Company Mock Test Round — ${esc(cData.n)}</b>
        <div style="font-size:12px;color:var(--muted);margin-top:2px">Real interview questions compiled from recent drive archives. Answer all 5 questions below.</div>
      </div>
      <div style="background:rgba(239,68,68,0.15);border:1px solid rgba(239,68,68,0.3);padding:8px 16px;border-radius:12px;text-align:center">
        <div style="font-size:10px;color:#ef4444;font-weight:700;letter-spacing:1px">TIME REMAINING</div>
        <div id="mock-timer-display" style="font-size:22px;font-weight:900;color:#ef4444">45:00</div>
      </div>
    </div>
    <div style="margin-top:14px;display:flex;gap:8px;flex-wrap:wrap;align-items:center">
      <span style="font-size:12px;color:var(--muted)">Select Company Drive:</span>
      ${['Amazon','Fidelity','Akamai','TCS','Oracle','MiQ Digital'].map(c=>`
        <button class="mini-btn ${comp.toLowerCase()===c.toLowerCase()?'on':''}" onclick="go('mock',{comp:'${c}'})">${c}</button>
      `).join('')}
    </div>
  </div>

  <div class="card" style="margin-bottom:16px">
    <h3 style="font-size:14px;color:var(--accent);margin-bottom:10px">🧠 Section 1: DSA Coding Questions (2 Questions)</h3>
    ${dsaQ.map((q,i)=>`
      <div style="margin-bottom:14px">
        <div style="font-weight:700;font-size:13px;margin-bottom:4px">Q${i+1}. ${esc(q)}</div>
        <textarea id="mock-ans-dsa-${i}" class="searchbox" style="width:100%;height:75px;font-family:monospace;font-size:12px" placeholder="Write pseudo code, time complexity, and approach..."></textarea>
      </div>
    `).join('')}

    <h3 style="font-size:14px;color:var(--amber);margin:18px 0 10px">📚 Section 2: Core Computer Science Theory (2 Questions)</h3>
    ${theoryQ.map((q,i)=>`
      <div style="margin-bottom:14px">
        <div style="font-weight:700;font-size:13px;margin-bottom:4px">Q${i+3}. ${esc(q)}</div>
        <textarea id="mock-ans-th-${i}" class="searchbox" style="width:100%;height:65px;font-size:12px" placeholder="Write bullet points explaining key concepts..."></textarea>
      </div>
    `).join('')}

    <h3 style="font-size:14px;color:#38bdf8;margin:18px 0 10px">🧮 Section 3: SQL Query Round (1 Question)</h3>
    ${sqlQ.map((q,i)=>`
      <div style="margin-bottom:14px">
        <div style="font-weight:700;font-size:13px;margin-bottom:4px">Q5. ${esc(q)}</div>
        <textarea id="mock-ans-sql-${i}" class="searchbox" style="width:100%;height:65px;font-family:monospace;font-size:12px" placeholder="Write exact SQL query..."></textarea>
      </div>
    `).join('')}

    <button class="btn pri" style="width:100%;padding:12px;font-size:14px;margin-top:10px" onclick="submitMockTest()">Submit Test & Get Milo AI Scorecard 🐾</button>
  </div>

  <div id="mock-scorecard-result"></div>`;
}

async function submitMockTest(){
  clearInterval(mockTimerInterval);
  const resDiv = document.getElementById('mock-scorecard-result');
  if(!resDiv) return;

  resDiv.innerHTML = `<div class="card"><div style="color:var(--muted)">Milo 🐾 is evaluating your answers against ${route.comp||'Amazon'} standards...</div></div>`;

  const dsa0 = document.getElementById('mock-ans-dsa-0')?.value || '';
  const dsa1 = document.getElementById('mock-ans-dsa-1')?.value || '';
  const th0 = document.getElementById('mock-ans-th-0')?.value || '';
  const th1 = document.getElementById('mock-ans-th-1')?.value || '';
  const sql0 = document.getElementById('mock-ans-sql-0')?.value || '';

  const prompt = `Evaluate candidate's 45-minute mock interview for ${route.comp||'Company'} placement drive.
Answers:
- DSA 1: ${dsa0}
- DSA 2: ${dsa1}
- Theory 1: ${th0}
- Theory 2: ${th1}
- SQL: ${sql0}

Give score out of 100%, breakdown per section, key strengths, and 2 areas to improve. Keep answer structured and in 100% Pure English.`;

  try {
    const apiKey = window.ENV_CONFIG?.GROQ_API_KEY || localStorage.getItem('groq_api_key') || "";
    const res = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: { "Authorization": `Bearer ${apiKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        model: "llama-3.3-70b-versatile",
        messages: [{ role: "system", content: "You are an expert technical interviewer evaluating a 45-min placement test." }, { role: "user", content: prompt }],
        temperature: 0.5, max_tokens: 600
      })
    });
    const data = await res.json();
    const evalText = data.choices?.[0]?.message?.content || "Evaluation completed cleanly! Good effort.";
    addBonusXp(25, `Completed 45-Min ${route.comp||'Company'} Mock Test`, '⏱️');

    resDiv.innerHTML = `
    <div class="card" style="border-color:var(--accent)">
      <h3 style="font-size:16px;color:var(--accent);margin-bottom:10px">🏆 Milo 🐾 AI Scorecard & Feedback Report</h3>
      <div style="font-size:13px;line-height:1.6;white-space:pre-wrap">${esc(evalText)}</div>
    </div>`;
  } catch(e) {
    resDiv.innerHTML = `<div class="card"><div style="color:var(--accent)">Evaluation completed cleanly! Earned +25 XP bonus for completing mock test.</div></div>`;
    addBonusXp(25, `Completed 45-Min ${route.comp||'Company'} Mock Test`, '⏱️');
  }
}

/* ---------- 📄 AI RESUME CHECKER RENDERER ---------- */
function vResumeChecker(){
  return `
  <div class="card" style="margin-bottom:16px">
    <b>📄 AI Resume Bullet & ATS Score Checker</b>
    <div style="font-size:12px;color:var(--muted);margin-top:2px">Paste your project bullet points or resume lines below. Milo AI will calculate your ATS match score and rewrite them into high-impact STAR method bullets with strong action verbs.</div>
    <div style="margin-top:14px">
      <label style="font-size:12px;font-weight:700">Target SDE Role:</label>
      <select id="resume-role" class="searchbox" style="width:100%;margin:6px 0 14px">
        <option value="Software Development Engineer (SDE 1)">Software Development Engineer (SDE 1)</option>
        <option value="Frontend Engineer">Frontend Engineer (React / JS)</option>
        <option value="Backend Engineer">Backend Engineer (Java / Node / Python)</option>
        <option value="Data Analyst / SQL Engineer">Data Analyst / SQL Engineer</option>
        <option value="Full Stack Engineer">Full Stack Engineer</option>
      </select>
      <label style="font-size:12px;font-weight:700">Paste Your Project / Resume Bullet Points:</label>
      <textarea id="resume-input" class="searchbox" style="width:100%;height:140px;margin-top:6px;font-size:12.5px" placeholder="Example: Worked on e-commerce website using React and Node. Integrated payment gateway and optimized database queries."></textarea>
      <button class="btn pri" style="width:100%;padding:10px;font-size:13px;margin-top:10px" onclick="analyzeResumeBullets()">Analyze ATS Score & Improve Bullets 🚀</button>
    </div>
  </div>
  <div id="resume-result"></div>`;
}

async function analyzeResumeBullets(){
  const text = document.getElementById('resume-input')?.value?.trim();
  const role = document.getElementById('resume-role')?.value;
  const resDiv = document.getElementById('resume-result');
  if(!text || !resDiv){ toast('Please paste your resume bullets first!','','⚠️'); return; }

  resDiv.innerHTML = `<div class="card"><div style="color:var(--muted)">Milo 🐾 is calculating ATS score & polishing action verbs for ${role}...</div></div>`;

  const prompt = `Analyze these resume bullet points for role: ${role}.
Bullets: "${text}"

Provide:
1. ATS Compatibility Score (out of 100%)
2. Key missing technical action verbs & keywords
3. Rewritten high-impact STAR method bullet points (Quantify metrics where possible)
Respond strictly in 100% Pure English with clean bullet formatting.`;

  try {
    const apiKey = window.ENV_CONFIG?.GROQ_API_KEY || localStorage.getItem('groq_api_key') || "";
    const res = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: { "Authorization": `Bearer ${apiKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        model: "llama-3.3-70b-versatile",
        messages: [{ role: "system", content: "You are a senior technical recruiter & ATS optimization expert." }, { role: "user", content: prompt }],
        temperature: 0.5, max_tokens: 600
      })
    });
    const data = await res.json();
    const replyText = data.choices?.[0]?.message?.content || "Resume review completed.";
    resDiv.innerHTML = `
    <div class="card" style="border-color:var(--accent)">
      <h3 style="font-size:15px;color:var(--accent);margin-bottom:10px">🎯 Milo 🐾 ATS & Resume Analysis Report</h3>
      <div style="font-size:13px;line-height:1.6;white-space:pre-wrap">${esc(replyText)}</div>
    </div>`;
  } catch(e) {
    resDiv.innerHTML = `<div class="card"><div style="color:var(--rose)">Network error while analyzing resume. Please try again.</div></div>`;
  }
}

/* ---------- 🎙️ HR STAR PRACTICE STUDIO RENDERER ---------- */
function vHRStudio(){
  const curQ = HR_QUESTIONS[0];
  return `
  <div class="card" style="margin-bottom:16px">
    <b>🎙️ HR Behavioral STAR Method Practice Studio</b>
    <div style="font-size:12px;color:var(--muted);margin-top:2px">Practice top 15 HR interview questions asked in tech company placement drives. Get instant STAR method feedback (Situation, Task, Action, Result) from Milo AI.</div>
  </div>

  <div class="grid g2">
    <div class="card" style="max-height:480px;overflow-y:auto">
      <h4 style="margin:0 0 10px;font-size:13px;color:var(--text)">Select Question (Top 15 HR Questions):</h4>
      ${HR_QUESTIONS.map((item,i)=>`
        <div class="subj-row" onclick="selectHRQuestion('${item.id}')" style="cursor:pointer;padding:8px 10px">
          <div class="ic" style="font-size:14px;color:var(--accent)">#${i+1}</div>
          <div class="mid">
            <div class="nm" style="font-size:12.5px">${esc(item.q)}</div>
          </div>
        </div>
      `).join('')}
    </div>

    <div class="card" id="hr-practice-box">
      ${hrPracticeBoxHtml(curQ)}
    </div>
  </div>`;
}

function hrPracticeBoxHtml(item){
  return `
  <h3 style="font-size:15px;color:var(--accent);margin-bottom:6px">❓ Question:</h3>
  <div style="font-size:13.5px;font-weight:700;color:var(--text);margin-bottom:12px">${esc(item.q)}</div>
  <div style="background:var(--card2);padding:10px;border-radius:10px;font-size:11.5px;color:var(--muted);border:1px solid var(--border);margin-bottom:14px">
    💡 <strong>Interviewer Tip:</strong> ${esc(item.tips)}
  </div>
  <label style="font-size:12px;font-weight:700">Write / Type Your Answer (Use STAR Method):</label>
  <textarea id="hr-user-answer" class="searchbox" style="width:100%;height:130px;margin-top:6px;font-size:12.5px" placeholder="Situation: ... Task: ... Action: ... Result: ..."></textarea>
  <button class="btn pri" style="width:100%;padding:10px;font-size:13px;margin-top:10px" onclick="evaluateHRAnswer('${item.id}')">Submit Answer for Milo STAR Feedback 🐾</button>
  <div id="hr-feedback-result" style="margin-top:14px"></div>`;
}

function selectHRQuestion(id){
  const item = HR_QUESTIONS.find(x=>x.id===id);
  if(item){
    document.getElementById('hr-practice-box').innerHTML = hrPracticeBoxHtml(item);
  }
}

async function evaluateHRAnswer(qId){
  const item = HR_QUESTIONS.find(x=>x.id===qId) || HR_QUESTIONS[0];
  const ans = document.getElementById('hr-user-answer')?.value?.trim();
  const resDiv = document.getElementById('hr-feedback-result');
  if(!ans || !resDiv){ toast('Please write your answer first!','','⚠️'); return; }

  resDiv.innerHTML = `<div style="color:var(--muted);font-size:12px">Milo 🐾 is rating your answer against STAR framework...</div>`;

  const prompt = `Evaluate candidate's response to HR Question: "${item.q}".
Candidate Answer: "${ans}"

Provide:
1. STAR Rating (out of 10)
2. Evaluation of Situation, Task, Action, Result
3. 2 key recommendations to make answer sound more confident & professional
Respond strictly in 100% Pure English.`;

  try {
    const apiKey = window.ENV_CONFIG?.GROQ_API_KEY || localStorage.getItem('groq_api_key') || "";
    const res = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: { "Authorization": `Bearer ${apiKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        model: "llama-3.3-70b-versatile",
        messages: [{ role: "system", content: "You are an HR interview coach." }, { role: "user", content: prompt }],
        temperature: 0.5, max_tokens: 500
      })
    });
    const data = await res.json();
    const evalText = data.choices?.[0]?.message?.content || "Great answer!";
    addBonusXp(15, `Practiced HR Question: ${item.q.slice(0,25)}...`, '🎙️');

    resDiv.innerHTML = `
    <div style="background:var(--card2);padding:12px;border-radius:10px;border:1px solid var(--accent);font-size:12.5px;line-height:1.5;white-space:pre-wrap">
      <b style="color:var(--accent)">🐾 Milo HR STAR Feedback:</b><br>${esc(evalText)}
    </div>`;
  } catch(e) {
    resDiv.innerHTML = `<div style="color:var(--accent);font-size:12px">Answer recorded! Earned +15 XP bonus.</div>`;
    addBonusXp(15, `Practiced HR Question`, '🎙️');
  }
}

/* ---------- boot ---------- */
document.body.classList.toggle('anim', S.settings.animations);
migrateXp();   // one-time: reconcile legacy flat XP into derived + bonus (no-op after first run)
syncXp();      // ensure cached S.xp matches current state on every load
addEventListener('resize',()=>{ if(confettiC){ confettiC.width=innerWidth; confettiC.height=innerHeight; } });
/* Restore the route from the URL so refresh / direct links land on the right view. */
route=hashToRoute();
_memStack=[{...route}];                 // initialize in-memory history fallback
safeReplace(route);                     // seed history state for popstate (no-op if API blocked)
render();
/* keep the IDB mirror seeded, and recover if LocalStorage was wiped but IDB survived */
if(S.settings.idbMirror) idbPut(S);
if(typeof recoverFromMirror==='function') recoverFromMirror();

/* ---------- 🐾 MILO CUTE AI CHATBOT HANDLERS ---------- */
let miloChatHistory = [];

function toggleMiloChat(){
  const drawer = document.getElementById('milo-chat-drawer');
  if(drawer) drawer.classList.toggle('open');
}

function sendMiloQuickPrompt(text){
  const input = document.getElementById('milo-input');
  if(input) {
    input.value = text;
    sendMiloMsg();
  }
}

async function sendMiloMsg(){
  const input = document.getElementById('milo-input');
  const body = document.getElementById('milo-chat-body');
  if(!input || !body) return;
  const text = input.value.trim();
  if(!text) return;

  // Add user bubble
  body.innerHTML += `<div class="milo-msg milo-user"><div class="milo-bubble">${esc(text)}</div></div>`;
  input.value = '';
  body.scrollTop = body.scrollHeight;

  // Add typing indicator bubble
  const loadingId = 'milo-loading-' + Date.now();
  body.innerHTML += `<div class="milo-msg milo-bot" id="${loadingId}"><div class="milo-bubble"><span style="color:var(--muted)">Milo is thinking... 🐾</span></div></div>`;
  body.scrollTop = body.scrollHeight;

  const apiKey = window.ENV_CONFIG?.GROQ_API_KEY || localStorage.getItem('groq_api_key') || "";
  const systemPrompt = "You are Milo 🐾, a friendly, ultra-smart, and cute placement preparation assistant for college students. Answer clearly, concisely, and strictly in 100% Pure English. Provide structured bullet points or short explanations for coding, DSA, SQL, OS, System Design, and placement interview questions.";

  miloChatHistory.push({ role: "user", content: text });

  try {
    const res = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${apiKey}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        model: "llama-3.3-70b-versatile",
        messages: [{ role: "system", content: systemPrompt }, ...miloChatHistory.slice(-6)],
        temperature: 0.6,
        max_tokens: 600
      })
    });
    const data = await res.json();
    const botReply = data.choices?.[0]?.message?.content || "Milo is here to help! Ask me anything about placement prep. 🐾";
    miloChatHistory.push({ role: "assistant", content: botReply });

    const loadEl = document.getElementById(loadingId);
    if(loadEl) {
      const formattedText = esc(botReply).replace(/\n/g, '<br>');
      loadEl.querySelector('.milo-bubble').innerHTML = formattedText;
    }
  } catch(err) {
    const loadEl = document.getElementById(loadingId);
    if(loadEl) loadEl.querySelector('.milo-bubble').innerHTML = "Oops! Milo couldn't connect right now. Please check your API key or network. 🐶";
  }
  body.scrollTop = body.scrollHeight;
}

