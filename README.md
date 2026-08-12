# 🚀 PlaceEdge — Placement Preparation Dashboard

A single-file, offline placement-prep tracker that combines the feel of
**GitHub Contributions + Notion + Duolingo + LeetCode**. The syllabus, hot-topic
flags, and company section are built from **75 real interview-question PDFs**
shared by the college placement cell (2025 & 2026 batches) — no placeholder data.

Everything is one `index.html`: HTML + CSS + vanilla JavaScript, no build tools,
no framework, no backend, no login. Open it and it just works, fully offline.

---

## ⚡ Quick start

1. Download `index.html`.
2. Double-click it (or open it in any modern browser — Chrome, Edge, Firefox, Safari).
3. Start tracking. Progress saves automatically to your browser.

> The only thing that touches the network is the Inter web font. Offline, it
> falls back to your system font and everything else keeps working.

---

## ✨ What's inside

| Area | What it does |
|------|--------------|
| **Dashboard** | Streak, level, XP, topics mastered, readiness %, overall progress bar, animated readiness ring, per-subject progress, Continue Learning, Recent Activity, and a GitHub-style heatmap. |
| **Subjects** | Full placement syllabus — 11 subjects, 144 topics. Each topic has a GeeksforGeeks link and the companies that asked it. Cycle status ⚪ Not Started → 🟡 Learning → 🟢 Mastered. |
| **DSA Problems** | 17 topic folders, 164 problems, each with difficulty, LeetCode + GFG links, notes, and revision count. Plus **Blind 75**, **NeetCode 150**, and **Striver A2Z** checklists. |
| **Companies** | "Frequently Asked by Companies" — 61 companies, grouped question-by-category, filterable by batch year and searchable. Includes a "most repeated topics" digest. |
| **Calendar** | GitHub-style year heatmap + a clickable month view. Click any day to see topics studied, XP earned, and estimated study time. |
| **Analytics** | Subject completion, monthly XP, difficulty breakdown, most/least studied subject, and readiness composition. |
| **Achievements** | 19 unlockable badges (First Topic, DSA Master, 7/30-Day Streak, 500/1000/5000 XP, Blind 75 Finisher, Interview Ready…). Locked badges show exactly what to chase. |
| **Settings** | Export/Import JSON, reset, animation toggle, local backup mirror, and auto-export. |

**By the numbers:** 11 subjects · 144 syllabus topics · 17 DSA folders · 164 DSA
problems · 3 curated sheets (Blind 75, NeetCode 150, Striver A2Z) · 61 companies
(54 from 2025, 14 from 2026) · 19 achievements.

---

## 🎮 How progress & XP work

Each **topic** cycles ⚪ → 🟡 → 🟢. The **first** time you reach 🟢 Mastered you
earn **+20 XP** (re-mastering later doesn't double-count).

Each **DSA problem** cycles ⚪ Not Started → 🟡 Attempted → 🟢 Solved. First solve
earns XP by difficulty: **Easy +10 · Medium +20 · Hard +30**.

Logging a **revision** on a mastered topic or solved problem earns **+5 XP** — this
is how you build spaced repetition into your prep.

- **Levels** rise as XP accumulates (each level needs progressively more XP).
- **Readiness %** is a weighted blend: Subjects 30% · DSA topics 20% · LeetCode 25% · Consistency 15% · Revision 10%.
- **Streaks** (current, longest, total days, this month) are computed from your daily activity.
- Problems in the DSA folders and the three sheets **share status by slug** — solving Two Sum anywhere marks it solved everywhere.

---

## 🔥 Where the data comes from

The syllabus and company sections were produced by reading **75 interview PDFs**
from the placement cell:

- **Companies identified** and their questions extracted, then grouped into
  Java / OOP / DSA / DBMS / SQL / OS / CN / System Design / Projects / Aptitude / HR.
- **Repeated topics prioritized** — anything asked by **3+ companies** gets a
  🔥 HOT badge, so you know what to master first (e.g. the four pillars of OOP
  appeared in 17+ drives, SQL joins in 25, the OSI model in 12, deadlock in 11).
- **LeetCode problems matched to interview questions** are tagged with the
  companies that asked them.
- **GeeksforGeeks articles** are linked for every applicable topic.

---

## 💾 Storage, backups & recovery

All data lives **in your browser** — primarily LocalStorage — and everything
saves automatically. Three layers protect it:

1. **IndexedDB mirror** *(on by default)* — every save also writes a copy to
   IndexedDB. If LocalStorage is partially cleared but IndexedDB survives, the
   app restores your progress automatically on the next open.
2. **Auto-export backup** *(opt-in, in Settings)* — after every N milestones
   (5/10/15/25/50), a dated JSON backup is silently downloaded. Because these
   files live **outside** the browser, they survive even a full "clear all site
   data." This is the strongest safeguard.
3. **Manual Export / Import JSON** — download a backup any time; import it to
   restore or to move to another browser.

### 🔀 Opening on another browser / device

Each browser has its **own separate storage**, so a different browser (or device,
or incognito window) starts **empty** — progress does **not** sync automatically.

To move progress:

1. **Settings → Export JSON** in the current browser.
2. Get the file to the other browser (email, cloud drive, USB…).
3. **Settings → Import JSON** there.

After importing, the two browsers are **independent copies** — they don't stay in
sync. Study on one, and you'll need to export/import again to update the other.

> Want true cross-device auto-sync (study on laptop, continue on phone)? That's
> the one thing the offline single-file design can't do — it would need a hosted
> database and a login (Firebase/Supabase). It's a larger change that turns this
> into an app with accounts and a backend.

---

## 🎨 Design & tech

- **Theme:** premium dark — background `#0F172A`, cards `#1E293B`, accent emerald
  `#22C55E`, 18px rounded corners, soft shadows, glassmorphism.
- **Font:** Inter (with a graceful system-font fallback offline).
- **Animations:** smooth transitions, animated progress bars, hover lift,
  animated counters, and confetti on milestones — all toggleable in Settings.
- **Code:** modular vanilla JS with reusable render functions; the entire UI is
  generated from structured JSON data objects rather than hardcoded HTML.
- **Responsive:** works on desktop and mobile, with a collapsible sidebar.

---

## 🗺️ Suggested workflow

1. Open **Companies** → read the "most repeated topics" list at the top.
   Master those 🔥 items first — they recur every year.
2. Work through **Subjects**, marking topics 🟡 as you start and 🟢 as you finish.
3. Grind **DSA** by folder, then complete **Blind 75 → NeetCode 150 → Striver A2Z**.
4. Add **notes** on tricky problems and **revise** regularly for the XP + retention.
5. Keep an eye on the **readiness ring** — aim for 70%+ before your drives.
6. Turn on **auto-export** (Settings) so you always have a recent file backup.

---

## ❓ FAQ

**Do I need internet?** No. Only the web font is fetched online; everything else
runs offline.

**Where's my data stored?** In your browser (LocalStorage + an IndexedDB mirror).
Nothing leaves your device unless you export it.

**I cleared my browser data — is my progress gone?** If the IndexedDB mirror
survived, it's recovered automatically. If you had an auto-export or manual
backup, import it. Otherwise it can't be recovered — so keep backups.

**Can two people share one file?** Yes — the HTML file has no personal data in it;
progress is per-browser. Share the file freely.

---

Built as a single self-contained `index.html`. No dependencies. No backend.
Just open it and prepare.