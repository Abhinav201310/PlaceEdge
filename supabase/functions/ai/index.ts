// =====================================================================
//  PlaceEdge · Supabase Edge Function "ai"
//  Secure proxy between the browser and Groq. The Groq key lives ONLY in
//  Supabase secrets (GROQ_API_KEY) and never reaches the browser.
//
//  Deploy from the dashboard (no CLI needed):
//    Edge Functions → Deploy a new function → Via Editor → name it "ai"
//    → paste this file → Deploy.  Keep "Verify JWT" ON.
//  Secrets: Edge Functions → Secrets → add GROQ_API_KEY (and optionally
//    GROQ_MODEL, default llama-3.3-70b-versatile).
//
//  Request:  POST { feature: "milo"|"mock"|"resume"|"hr", input: {...} }
//  Response: { text: string }  or  { error: string }
// =====================================================================
import { createClient } from "npm:@supabase/supabase-js@2";

const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const MODEL = Deno.env.get("GROQ_MODEL") ?? "llama-3.3-70b-versatile";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

type Msg = { role: "system" | "user" | "assistant"; content: string };
type Built = { messages: Msg[]; max_tokens: number; temperature: number };
// deno-lint-ignore no-explicit-any
type Input = Record<string, any>;

const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { ...CORS, "Content-Type": "application/json" } });

/** Coerce anything to a trimmed string with a hard length cap. */
const clip = (v: unknown, max: number) => String(v ?? "").trim().slice(0, max);

const MILO_SYSTEM =
  "You are Milo 🐾, a friendly, ultra-smart, and cute placement preparation assistant for college students. " +
  "Answer clearly, concisely, and strictly in 100% Pure English. Provide structured bullet points or short " +
  "explanations for coding, DSA, SQL, OS, System Design, and placement interview questions.";

/** Prompts are built server-side so the endpoint can't be used as a free general-purpose proxy. */
const FEATURES: Record<string, (i: Input) => Built> = {
  milo: (i) => {
    const history: Msg[] = (Array.isArray(i.messages) ? i.messages : [])
      .filter((m: Input) => m && (m.role === "user" || m.role === "assistant"))
      .slice(-6)
      .map((m: Input) => ({ role: m.role, content: clip(m.content, 2000) }));
    if (!history.length || history[history.length - 1].role !== "user") throw new Error("Ask Milo something first.");
    return { messages: [{ role: "system", content: MILO_SYSTEM }, ...history], max_tokens: 600, temperature: 0.6 };
  },

  mock: (i) => {
    const comp = clip(i.company, 60) || "Company";
    const a = (i.answers ?? {}) as Input;
    const prompt = `Evaluate candidate's 45-minute mock interview for ${comp} placement drive.
Answers:
- DSA 1: ${clip(a.dsa0, 2000)}
- DSA 2: ${clip(a.dsa1, 2000)}
- Theory 1: ${clip(a.th0, 2000)}
- Theory 2: ${clip(a.th1, 2000)}
- SQL: ${clip(a.sql0, 2000)}

Give score out of 100%, breakdown per section, key strengths, and 2 areas to improve. Keep answer structured and in 100% Pure English.`;
    return {
      messages: [
        { role: "system", content: "You are an expert technical interviewer evaluating a 45-min placement test." },
        { role: "user", content: prompt },
      ],
      max_tokens: 600,
      temperature: 0.5,
    };
  },

  resume: (i) => {
    const text = clip(i.text, 4000);
    if (!text) throw new Error("Paste your resume bullets first.");
    const role = clip(i.role, 80) || "Software Development Engineer (SDE 1)";
    const prompt = `Analyze these resume bullet points for role: ${role}.
Bullets: "${text}"

Provide:
1. ATS Compatibility Score (out of 100%)
2. Key missing technical action verbs & keywords
3. Rewritten high-impact STAR method bullet points (Quantify metrics where possible)
Respond strictly in 100% Pure English with clean bullet formatting.`;
    return {
      messages: [
        { role: "system", content: "You are a senior technical recruiter & ATS optimization expert." },
        { role: "user", content: prompt },
      ],
      max_tokens: 600,
      temperature: 0.5,
    };
  },

  hr: (i) => {
    const answer = clip(i.answer, 3000);
    if (!answer) throw new Error("Write your answer first.");
    const prompt = `Evaluate candidate's response to HR Question: "${clip(i.question, 300)}".
Candidate Answer: "${answer}"

Provide:
1. STAR Rating (out of 10)
2. Evaluation of Situation, Task, Action, Result
3. 2 key recommendations to make answer sound more confident & professional
Respond strictly in 100% Pure English.`;
    return {
      messages: [
        { role: "system", content: "You are an HR interview coach." },
        { role: "user", content: prompt },
      ],
      max_tokens: 500,
      temperature: 0.5,
    };
  },
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: CORS });
  if (req.method !== "POST") return json({ error: "Method not allowed" }, 405);

  // 1) Who is calling? (Verify JWT is on, but we also need the user id for quotas.)
  const auth = req.headers.get("Authorization");
  if (!auth) return json({ error: "Please log in to use Milo AI." }, 401);
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_ANON_KEY")!,
    { global: { headers: { Authorization: auth } } },
  );
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return json({ error: "Your session expired. Please log in again." }, 401);

  // 2) Validate the request and build the prompt.
  let body: Input;
  try { body = await req.json(); } catch { return json({ error: "Invalid JSON body." }, 400); }
  const build = FEATURES[String(body?.feature)];
  if (!build) return json({ error: "Unknown AI feature." }, 400);
  let cfg: Built;
  try { cfg = build((body.input ?? {}) as Input); }
  catch (e) { return json({ error: (e as Error).message }, 400); }

  // 3) Per-user rate limit (30/hour) enforced in Postgres.
  const { data: allowed, error: quotaErr } = await supabase.rpc("ai_take_quota", { p_feature: body.feature });
  if (quotaErr) { console.error("quota error", quotaErr); return json({ error: "Could not check AI quota." }, 500); }
  if (!allowed) return json({ error: "Milo needs a break 🐾 — hourly AI limit reached. Try again later." }, 429);

  // 4) Call Groq with the server-side key.
  const key = Deno.env.get("GROQ_API_KEY");
  if (!key) return json({ error: "AI is not configured yet (missing GROQ_API_KEY secret)." }, 500);

  try {
    const res = await fetch(GROQ_URL, {
      method: "POST",
      headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
      body: JSON.stringify({ model: MODEL, ...cfg }),
    });
    if (!res.ok) {
      console.error("groq error", res.status, await res.text());
      return json({ error: "The AI provider is busy right now. Please try again." }, 502);
    }
    const data = await res.json();
    return json({ text: data?.choices?.[0]?.message?.content ?? "" });
  } catch (e) {
    console.error("groq fetch failed", e);
    return json({ error: "Could not reach the AI provider." }, 502);
  }
});
