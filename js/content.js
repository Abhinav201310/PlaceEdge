/* ============================================================
   CONTENT OVERRIDE · apply admin-published content from cache
   Runs synchronously AFTER data.js and BEFORE state.js, so every
   lookup table in state.js is built from the freshest content.
   backend.js refreshes this cache in the background; new content
   shows up on the next page load. If anything looks wrong we keep
   the bundled data.js (offline-safe fallback).
   ============================================================ */
const CONTENT_CACHE_KEY='placeedge.content';
(function applyCachedContent(){
  try{
    const raw=localStorage.getItem(CONTENT_CACHE_KEY);
    if(!raw) return;
    const d=(JSON.parse(raw)||{}).data;
    if(!d) return;
    const okSubjects=Array.isArray(d.subjects)&&d.subjects.length&&d.subjects.every(s=>s&&s.id&&Array.isArray(s.topics));
    const okDsa=Array.isArray(d.dsa)&&d.dsa.length&&d.dsa.every(f=>f&&f.id&&Array.isArray(f.problems));
    const okCompanies=Array.isArray(d.companies)&&d.companies.every(c=>c&&c.n&&Array.isArray(c.yr)&&c.q&&typeof c.q==='object');
    const okSheets=d.sheets&&typeof d.sheets==='object'&&Object.values(d.sheets).every(s=>s&&Array.isArray(s.groups));
    if(!(okSubjects&&okDsa&&okCompanies&&okSheets)){ console.warn('Cached content failed validation — using bundled data'); return; }
    // data.js declares these with const, so mutate in place instead of reassigning.
    SUBJECTS.splice(0,SUBJECTS.length,...d.subjects);
    DSA.splice(0,DSA.length,...d.dsa);
    COMPANIES.splice(0,COMPANIES.length,...d.companies);
    Object.keys(SHEETS).forEach(k=>delete SHEETS[k]);
    Object.assign(SHEETS,d.sheets);
  }catch(e){ console.warn('Cached content ignored',e); }
})();
