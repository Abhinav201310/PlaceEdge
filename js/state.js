/* ============================================================
   CORE · STATE, PERSISTENCE, GAMIFICATION, UTILITIES
   ============================================================ */
const LS_KEY='placeedge.v1';
const clone=o=>(typeof structuredClone==='function')?structuredClone(o):JSON.parse(JSON.stringify(o)); // fallback for older browsers
const todayKey=(d=new Date())=>`${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}`;

const DEFAULT_STATE={
  topics:{},        // topicId -> {s:0|1|2, rev:number, note:string, masteredAt:ts}
  problems:{},      // slug   -> {s:0|1|2, rev:number, note:string, solvedAt:ts}
  sprint:{},        // dayNumber -> timestamp
  xp:0,             // legacy field; kept for back-compat. Live XP is derived (see xpTotal)
  bonusXp:0,        // one-way rewards that reverts must NOT remove (revisions)
  xpMigrated:false, // guards the one-time migration of legacy flat XP into bonusXp
  achievements:{},  // achId -> timestamp
  days:{},          // 'YYYY-MM-DD' -> {xp:number, items:[label,...]}
  activity:[],      // [{t:timestamp, ic, label}] newest first (cap 60)
  settings:{animations:true, theme:'dark', idbMirror:true, autoExport:false, autoExportEvery:15}
};
let S=loadState();
let saveCount=0; // tracks milestones since last auto-export

/* ============================================================
   CHANGE STAMPS · for cross-device sync
   Every topic/problem entry carries `u` = last-modified time.
   save() diffs entries against a shadow copy and stamps the
   changed ones, so the sync merge can pick the newest per key
   without touching every place that edits S.
   ============================================================ */
let _shadow={t:{},p:{}};
const _entrySig=v=>JSON.stringify({...v,u:undefined});   // signature without the stamp itself
function resetShadow(){
  _shadow={t:{},p:{}};
  for(const k in S.topics) _shadow.t[k]=_entrySig(S.topics[k]);
  for(const k in S.problems) _shadow.p[k]=_entrySig(S.problems[k]);
}
function stampChanges(){
  const now=Date.now();
  for(const k in S.topics){ const sig=_entrySig(S.topics[k]); if(_shadow.t[k]!==sig){ S.topics[k].u=now; _shadow.t[k]=sig; } }
  for(const k in S.problems){ const sig=_entrySig(S.problems[k]); if(_shadow.p[k]!==sig){ S.problems[k].u=now; _shadow.p[k]=sig; } }
}
resetShadow();

/* ============================================================
   STORAGE RESILIENCE · IndexedDB mirror
   LocalStorage stays the primary (synchronous) store. On every
   save we also mirror to IndexedDB, which survives some cases
   where LocalStorage is cleared and offers a far larger quota.
   On boot, if LocalStorage is empty but IDB has data, we restore.
   ============================================================ */
const IDB_NAME='placeedge-db', IDB_STORE='state', IDB_KEY='current';
let _idb=null;
function idbOpen(){
  return new Promise((res,rej)=>{
    if(_idb) return res(_idb);
    if(!('indexedDB' in window)) return rej('no-idb');
    const req=indexedDB.open(IDB_NAME,1);
    req.onupgradeneeded=()=>{ const db=req.result; if(!db.objectStoreNames.contains(IDB_STORE)) db.createObjectStore(IDB_STORE); };
    req.onsuccess=()=>{ _idb=req.result; res(_idb); };
    req.onerror=()=>rej(req.error);
  });
}
async function idbPut(obj){
  try{ const db=await idbOpen();
    await new Promise((res,rej)=>{ const tx=db.transaction(IDB_STORE,'readwrite');
      tx.objectStore(IDB_STORE).put(JSON.stringify(obj),IDB_KEY);
      tx.oncomplete=res; tx.onerror=()=>rej(tx.error); });
  }catch(e){ /* IDB unavailable (private mode etc.) — LocalStorage still holds data */ }
}
async function idbGet(){
  try{ const db=await idbOpen();
    return await new Promise((res,rej)=>{ const tx=db.transaction(IDB_STORE,'readonly');
      const r=tx.objectStore(IDB_STORE).get(IDB_KEY);
      r.onsuccess=()=>res(r.result?JSON.parse(r.result):null); r.onerror=()=>rej(r.error); });
  }catch(e){ return null; }
}
/* Recover from the IDB mirror when LocalStorage was cleared but IDB survived. */
async function recoverFromMirror(){
  if(localStorage.getItem(LS_KEY)) return;              // LS already has data → nothing to do
  const mirrored=await idbGet();
  if(mirrored && ('xp' in mirrored)){
    S={...clone(DEFAULT_STATE), ...mirrored, settings:{...DEFAULT_STATE.settings, ...(mirrored.settings||{})}};
    if(!('bonusXp' in mirrored) || !('xpMigrated' in mirrored)) S.xpMigrated=false;
    migrateXp(); syncXp();
    localStorage.setItem(LS_KEY, JSON.stringify(S));     // rehydrate primary store
    document.body.classList.toggle('anim', S.settings.animations);
    render(); refreshChrome();
    toast('Recovered your progress from local backup','','♻️');
  }
}

function loadState(){
  try{
    const raw=localStorage.getItem(LS_KEY);
    if(!raw) return clone(DEFAULT_STATE);
    const s=JSON.parse(raw);
    return {...clone(DEFAULT_STATE), ...s, settings:{...DEFAULT_STATE.settings, ...(s.settings||{})}};
  }catch(e){ return clone(DEFAULT_STATE); }
}
function save(){
  stampChanges();
  try{ localStorage.setItem(LS_KEY, JSON.stringify(S)); }
  catch(e){ console.warn('LocalStorage save failed',e); toast('Browser storage is full or blocked — export a backup soon','','⚠️'); }
  if(S.settings.idbMirror) idbPut(S);   // async, non-blocking mirror
  if(typeof scheduleSync==='function') scheduleSync();   // cloud sync (backend.js), debounced; no-op when logged out
}
/* Called by milestone actions (mastering / solving) to trigger periodic auto-export. */
function maybeAutoExport(){
  if(!S.settings.autoExport) return;
  saveCount++;
  const every=Math.max(1, S.settings.autoExportEvery||15);
  if(saveCount>=every){ saveCount=0; exportData(true); }
}

/* ---------- Lookup helpers ---------- */
const ALL_TOPICS=SUBJECTS.flatMap(s=>s.topics.map(t=>({...t, subj:s.id, subjName:s.name})));
const TOPIC_BY_ID=Object.fromEntries(ALL_TOPICS.map(t=>[t.id,t]));
const DSA_PROBLEMS=DSA.flatMap(f=>f.problems.map(p=>({...p, folder:f.id, folderName:f.name})));
const PROB_META={}; // slug -> {n,d,lc,gfg} merged from dsa + sheets
DSA_PROBLEMS.forEach(p=>{ PROB_META[p.s]={n:p.n,d:p.d,lc:p.lc,gfg:p.gfg}; });
Object.values(SHEETS).forEach(sh=>sh.groups.forEach(g=>g[1].forEach(([n,d,slug])=>{
  if(!PROB_META[slug]) PROB_META[slug]={n,d,lc:LC+slug+'/',gfg:null};
})));
const tState=id=>S.topics[id]||{s:0,rev:0,note:''};
const pState=sl=>S.problems[sl]||{s:0,rev:0,note:''};

/* ---------- XP · Levels ----------
   XP is DERIVED from current state, not a permanent running total.
     earnedXp() = 20 per currently-mastered topic
                + difficulty value per currently-solved problem
     bonusXp    = one-way rewards (revisions) that reverting must NOT undo
   S.xp is kept as a cached mirror of the live total so old readers/UI still
   work, but it is always recomputed from state — it can never inflate. */
const xpForProblem=d=>d==='H'?30:d==='M'?20:10;
const XP_TOPIC=20, XP_REV=5;
function earnedXp(){
  let x=0;
  for(const id in S.topics){ if(S.topics[id].s===2) x+=XP_TOPIC; }
  for(const sl in S.problems){ if(S.problems[sl].s===2){ const m=PROB_META[sl]; x+=m?xpForProblem(m.d):XP_TOPIC; } }
  return x;
}
function xpTotal(){ return earnedXp()+(S.bonusXp||0); }
/* Recompute the cached S.xp from live state. Call after ANY status change. */
function syncXp(){ S.xp=xpTotal(); }

/* One-time migration for existing saves created before the derived-XP refactor.
   Their S.xp was a flat total that already included topic/problem awards AND
   revisions. We compute how much of the old total came from revisions and move
   only that into bonusXp, so the user's XP stays exactly the same after upgrade. */
function migrateXp(){
  if(S.xpMigrated) return;
  const base=earnedXp();
  const legacy=(typeof S.xp==='number')?S.xp:0;
  S.bonusXp=Math.max(0, legacy-base);   // leftover = revisions earned historically
  S.xpMigrated=true;
  syncXp();
}

function levelFromXp(xp){ let l=1; while(xp>=xpToReach(l+1)) l++; return l; }
function xpToReach(l){ return 60*(l-1)*l; }            // cumulative XP needed for level l
function levelProgress(){
  const total=S.xp, l=levelFromXp(total), lo=xpToReach(l), hi=xpToReach(l+1);
  return {level:l, pct:Math.min(100,Math.round((total-lo)/(hi-lo)*100)), cur:total-lo, need:hi-lo};
}

/* Called after a status change that MAY have changed earned XP.
   Recomputes the total, logs activity, fires level-up/achievements, persists. */
function applyXpChange(label, icon, deltaForToast){
  const before=levelFromXp(S.xp);
  syncXp();
  const after=levelFromXp(S.xp);
  if(label){
    const day=todayKey();
    if(!S.days[day]) S.days[day]={xp:0,items:[]};
    if(deltaForToast>0) S.days[day].xp+=deltaForToast;   // heatmap credits positive gains only
    S.days[day].items.unshift(label); S.days[day].items=S.days[day].items.slice(0,40);
    S.activity.unshift({t:Date.now(), ic:icon, label}); S.activity=S.activity.slice(0,60);
  }
  if(deltaForToast>0) toast(`+${deltaForToast} XP — ${label||'progress'}`, 'xp', '💎');
  else if(deltaForToast<0) toast(`${deltaForToast} XP — ${label||'reverted'}`, '', '↩️');
  if(after>before){ toast(`Level up! You reached Level ${after} ⭐`,'', '⭐'); confetti(); }
  checkAchievements(); save(); refreshChrome();
  if(deltaForToast>0) maybeAutoExport();
}
/* Award pure bonus XP (revisions) — a one-way action, tracked separately. */
function addBonusXp(amount, label, icon='✨'){
  S.bonusXp=(S.bonusXp||0)+amount;
  applyXpChange(label, icon, amount);
}
function logStudy(label, icon='📖'){ // activity without XP (e.g. set to Learning)
  const day=todayKey();
  if(!S.days[day]) S.days[day]={xp:0,items:[]};
  S.days[day].items.unshift(label); S.days[day].items=S.days[day].items.slice(0,40);
  S.activity.unshift({t:Date.now(), ic:icon, label}); S.activity=S.activity.slice(0,60);
  save(); refreshChrome();
}

/* ---------- Streaks ---------- */
function streaks(){
  const keys=Object.keys(S.days).filter(k=>S.days[k].items.length||S.days[k].xp>0).sort();
  const set=new Set(keys);
  let cur=0; const d=new Date();
  if(!set.has(todayKey(d))) d.setDate(d.getDate()-1); // streak survives until today is missed
  while(set.has(todayKey(d))){ cur++; d.setDate(d.getDate()-1); }
  let best=0,run=0,prev=null;
  keys.forEach(k=>{
    if(prev){ const diff=(new Date(k)-new Date(prev))/864e5; run=diff===1?run+1:1; }
    else run=1;
    best=Math.max(best,run); prev=k;
  });
  const now=new Date(), monthPrefix=`${now.getFullYear()}-${String(now.getMonth()+1).padStart(2,'0')}`;
  return {cur, best, total:keys.length, month:keys.filter(k=>k.startsWith(monthPrefix)).length};
}

/* ---------- Progress calculators ---------- */
function subjectProgress(id){
  if(id==='dsa'){ const done=DSA.reduce((a,f)=>a+f.problems.filter(p=>pState(p.s).s===2).length,0);
    const tot=DSA.reduce((a,f)=>a+f.problems.length,0);
    return {done, total:tot, pct:tot?Math.round(done/tot*100):0}; }
  const subj=SUBJECTS.find(s=>s.id===id); if(!subj) return {done:0,total:0,pct:0};
  const done=subj.topics.filter(t=>tState(t.id).s===2).length;
  return {done, total:subj.topics.length, pct:subj.topics.length?Math.round(done/subj.topics.length*100):0};
}
function overallStats(){
  const topicsDone=ALL_TOPICS.filter(t=>tState(t.id).s===2).length;
  const solved=Object.entries(S.problems).filter(([sl,v])=>v.s===2).length;
  const attempted=Object.entries(S.problems).filter(([sl,v])=>v.s===1).length;
  const revisions=Object.values(S.problems).reduce((a,v)=>a+(v.rev||0),0)+Object.values(S.topics).reduce((a,v)=>a+(v.rev||0),0);
  return {topicsDone, topicsTotal:ALL_TOPICS.length, solved, attempted, revisions};
}
function readiness(){
  const o=overallStats(), st=streaks();
  const subjPct=SUBJECTS.reduce((a,s)=>a+subjectProgress(s.id).pct,0)/SUBJECTS.length;      // theory subjects
  const dsaTopicPct=DSA.filter(f=>tState('dsat-'+f.id).s===2).length/DSA.length*100;         // DSA topic mastery
  const lcPct=Math.min(100, o.solved/120*100);                                               // 120 solves ≈ ready
  const consistency=Math.min(100, st.cur*8 + st.month*2);
  const revision=Math.min(100, o.revisions*4);
  const score=Math.round(subjPct*.30 + dsaTopicPct*.20 + lcPct*.25 + consistency*.15 + revision*.10);
  return {score:Math.min(100,score), parts:{'Subjects':Math.round(subjPct),'DSA Topics':Math.round(dsaTopicPct),'LeetCode':Math.round(lcPct),'Consistency':Math.round(consistency),'Revision':Math.round(revision)}};
}

/* ---------- Achievements ---------- */
const ACHIEVEMENTS=[
 {id:'first',ic:'🌱',n:'First Topic',d:'Master your very first topic',f:o=>o.topicsDone>=1},
 {id:'t10',ic:'📗',n:'10 Topics',d:'Master 10 syllabus topics',f:o=>o.topicsDone>=10},
 {id:'t50',ic:'📘',n:'50 Topics',d:'Master 50 syllabus topics',f:o=>o.topicsDone>=50},
 {id:'t100',ic:'📚',n:'100 Topics',d:'Master 100 syllabus topics',f:o=>o.topicsDone>=100},
 {id:'java1',ic:'☕',n:'Java Beginner',d:'Master 5 Java topics',f:()=>SUBJECTS.find(s=>s.id==='java').topics.filter(t=>tState(t.id).s===2).length>=5},
 {id:'oops',ic:'🧩',n:'OOP Guru',d:'Master every OOP topic — asked by 30+ companies',f:()=>subjectProgress('oop').pct===100},
 {id:'sqlpro',ic:'🧮',n:'Query Crusher',d:'Master every SQL topic',f:()=>subjectProgress('sql').pct===100},
 {id:'dsa1',ic:'🗺️',n:'DSA Explorer',d:'Solve 10 problems',f:o=>o.solved>=10},
 {id:'dsa50',ic:'⚔️',n:'DSA Warrior',d:'Solve 50 problems',f:o=>o.solved>=50},
 {id:'dsa100',ic:'👑',n:'DSA Master',d:'Solve 100 problems',f:o=>o.solved>=100},
 {id:'hard1',ic:'🔥',n:'Hard Mode',d:'Solve your first Hard problem',f:()=>Object.entries(S.problems).some(([sl,v])=>v.s===2&&PROB_META[sl]&&PROB_META[sl].d==='H')},
 {id:'streak7',ic:'📅',n:'7 Day Streak',d:'Study 7 days in a row',f:()=>streaks().cur>=7||streaks().best>=7},
 {id:'streak30',ic:'🏆',n:'30 Day Streak',d:'Study 30 days in a row',f:()=>streaks().best>=30},
 {id:'xp500',ic:'💎',n:'500 XP',d:'Earn 500 XP',f:()=>S.xp>=500},
 {id:'xp1000',ic:'💠',n:'1000 XP',d:'Earn 1000 XP',f:()=>S.xp>=1000},
 {id:'xp5000',ic:'🌟',n:'5000 XP',d:'Earn 5000 XP',f:()=>S.xp>=5000},
 {id:'rev10',ic:'🔁',n:'Revision Ritual',d:'Log 10 revisions',f:o=>o.revisions>=10},
 {id:'blind',ic:'🎯',n:'Blind 75 Finisher',d:'Complete the Blind 75 sheet',f:()=>sheetProgress('blind75').pct===100},
 {id:'ready70',ic:'🚀',n:'Interview Ready',d:'Reach 70% placement readiness',f:()=>readiness().score>=70},
];
function checkAchievements(){
  const o=overallStats(); let unlocked=false;
  ACHIEVEMENTS.forEach(a=>{
    if(!S.achievements[a.id] && a.f(o)){
      S.achievements[a.id]=Date.now(); unlocked=true;
      toast(`Achievement unlocked: ${a.n}!`, '', a.ic); confetti();
      S.activity.unshift({t:Date.now(), ic:'🏅', label:`Unlocked achievement — ${a.n}`});
    }
  });
  if(unlocked) save();
}
function sheetProgress(key){
  const seen=new Set(); let done=0,total=0;
  SHEETS[key].groups.forEach(g=>g[1].forEach(([n,d,sl])=>{
    if(seen.has(sl)) return; seen.add(sl); total++;
    if(pState(sl).s===2) done++;
  }));
  return {done,total,pct:total?Math.round(done/total*100):0};
}
