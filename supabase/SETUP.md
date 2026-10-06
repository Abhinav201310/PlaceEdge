# 🚀 PlaceEdge — Supabase Cloud Backend Setup Guide

Aapne **no-download** approach chuna hai. Iska matlab aapko apne computer par **kuch bhi install nahi karna hai**. Sab kuch **Supabase ki website** (Free Tier) se direct chalega.

---

## 📌 Step 1: Free Supabase Project Banao (2 Minute)

1. [supabase.com](https://supabase.com) par jao aur free account banao (GitHub ya Google login se).
2. **"New Project"** par click karo.
   - Name: `PlaceEdge`
   - Database Password: Apna koi secure password daal do
   - Region: `South Asia (Mumbai)` ya nearest region select karo
3. Project create hone ka 1 minute wait karo.

---

## 📌 Step 2: Database Schema Run Karo (1 Click)

1. Left sidebar se **SQL Editor** (icon `>_`) par click karo.
2. Click **"New Query"**.
3. Hamare project ki file [supabase/schema.sql](file:///c:/Users/abhin/OneDrive/Documents/GITHUB%20PROJECTS/PlaceEdge/supabase/schema.sql) ka saara code copy karo aur yahan paste kar do.
4. Neeche **"Run"** button daba do.
   > ✅ Saari tables (`profiles`, `progress`, `content`, `groups`), Row Level Security (RLS) aur server-side XP calculation triggers setup ho jayenge!

---

## 📌 Step 3: API Keys Copy Karke PlaceEdge Mein Daalo

1. Left sidebar se **Project Settings** (Gear icon ⚙️) → **API** par jao.
2. Wahan se do cheezein copy karo:
   - **Project URL** (e.g. `https://xyzcompany.supabase.co`)
   - **anon / public key** (Project API Keys ke andar)
3. Apne project ki file [config.js](file:///c:/Users/abhin/OneDrive/Documents/GITHUB%20PROJECTS/PlaceEdge/config.js) open karo aur paste kar do:
   ```javascript
   window.ENV_CONFIG = {
     SUPABASE_URL: "https://xyzcompany.supabase.co",
     SUPABASE_ANON_KEY: "eyJh..."
   };
   ```

---

## 📌 Step 4: Groq AI Setup (Edge Function - Milo AI)

Groq API key ab frontend browser mein nahi rahegi, balki secure cloud function mein rahegi:

1. Left sidebar se **Edge Functions** par jao.
2. Click **"Deploy a Function"** → choose **"Via Web Editor"** (bina kisi CLI ya install ke!).
   - Function Name: `ai`
   - Code box mein hamari file [supabase/functions/ai/index.ts](file:///c:/Users/abhin/OneDrive/Documents/GITHUB%20PROJECTS/PlaceEdge/supabase/functions/ai/index.ts) ka poora code paste kar do.
   - Click **Deploy**.
3. **Groq Secret Add Karo**:
   - Edge Functions page par **"Secrets"** tab par click karo.
   - Click **"Add Secret"**:
     - Name: `GROQ_API_KEY`
     - Value: `gsk_...` (Aapki Groq API key)
   - Click **Save**.

---

## 📌 Step 5: Test & Enjoy!

1. Ab [index.html](file:///c:/Users/abhin/OneDrive/Documents/GITHUB%20PROJECTS/PlaceEdge/index.html) ko browser mein open karo.
2. Top right par **"Account / 👤 Log in"** par click karo.
3. Sign up karo ya login karo:
   - ✅ Laptop aur phone dono par progress live sync hogi.
   - ✅ Leaderboard tab mein aapki rank aur friend groups chalenge.
   - ✅ Milo AI, Mock Test, ATS Checker server ke zariye chalenge.
   - ✅ Bina internet ke bhi app smoothly offline chalega!

---

## 👑 Extra: Admin Banna (Content Update karne ke liye)

Apne account ko admin banane ke liye:
1. Supabase **SQL Editor** mein jaao aur ye query run karo:
   ```sql
   update public.profiles
   set is_admin = true
   where id = (select id from auth.users where email = 'aapka_email@gmail.com');
   ```
2. Phir browser mein [admin.html](file:///c:/Users/abhin/OneDrive/Documents/GITHUB%20PROJECTS/PlaceEdge/admin.html) kholo aur **"🚀 Publish Bundled Content to Cloud"** click karo!
