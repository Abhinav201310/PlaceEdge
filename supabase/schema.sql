-- =====================================================================
--  PlaceEdge · Supabase schema
--  Paste this whole file into Supabase Dashboard → SQL Editor → Run.
--  It is idempotent: running it again is safe.
--
--  Security model
--  · Every table has Row Level Security (RLS) enabled.
--  · Users can only read/write their OWN profile + progress rows.
--  · Leaderboard XP is recomputed on the server from the saved state,
--    so editing XP numbers in the browser cannot cheat the ranking.
--  · Groups, leaderboards, AI quota and admin publishing go through
--    SECURITY DEFINER functions that check auth.uid() themselves.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. PROFILES (one row per auth user)
-- ---------------------------------------------------------------------
create table if not exists public.profiles (
  id                  uuid primary key references auth.users(id) on delete cascade,
  display_name        text not null default 'Student'
                      check (char_length(display_name) between 1 and 40),
  avatar_url          text,
  show_on_leaderboard boolean not null default true,
  is_admin            boolean not null default false,
  created_at          timestamptz not null default now()
);
alter table public.profiles enable row level security;

drop policy if exists "profiles: read own"   on public.profiles;
drop policy if exists "profiles: update own" on public.profiles;
create policy "profiles: read own"   on public.profiles for select to authenticated using (id = auth.uid());
create policy "profiles: update own" on public.profiles for update to authenticated
  using (id = auth.uid()) with check (id = auth.uid());

-- Users may only change these columns (never is_admin).
revoke insert, update, delete on public.profiles from anon, authenticated;
grant  update (display_name, avatar_url, show_on_leaderboard) on public.profiles to authenticated;

-- ---------------------------------------------------------------------
-- 2. PROGRESS (the app's whole `S` state as JSON + derived stats)
-- ---------------------------------------------------------------------
create table if not exists public.progress (
  user_id         uuid primary key references auth.users(id) on delete cascade,
  state           jsonb   not null default '{}'::jsonb
                  check (pg_column_size(state) < 1500000),
  version         integer not null default 0,      -- optimistic concurrency
  xp              integer not null default 0,      -- server computed
  level           integer not null default 1,      -- server computed
  streak          integer not null default 0,      -- client value, clamped
  solved          integer not null default 0,      -- server computed
  topics_mastered integer not null default 0,      -- server computed
  updated_at      timestamptz not null default now()
);
alter table public.progress enable row level security;

drop policy if exists "progress: read own"   on public.progress;
drop policy if exists "progress: insert own" on public.progress;
drop policy if exists "progress: update own" on public.progress;
create policy "progress: read own"   on public.progress for select to authenticated using (user_id = auth.uid());
create policy "progress: insert own" on public.progress for insert to authenticated with check (user_id = auth.uid());
create policy "progress: update own" on public.progress for update to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

revoke insert, update, delete on public.progress from anon, authenticated;
grant  insert (user_id, state, version, streak) on public.progress to authenticated;
grant  update (state, version, streak)          on public.progress to authenticated;

-- ---------------------------------------------------------------------
-- 3. VALID ITEMS (which topic ids / problem slugs earn XP, and how much)
--    Filled by admin_publish_content() from the content bundle.
-- ---------------------------------------------------------------------
create table if not exists public.valid_items (
  kind char(1) not null check (kind in ('t','p')),  -- t = topic, p = problem
  key  text    not null,
  xp   integer not null,
  primary key (kind, key)
);
alter table public.valid_items enable row level security;
drop policy if exists "valid_items: public read" on public.valid_items;
create policy "valid_items: public read" on public.valid_items for select using (true);
revoke insert, update, delete on public.valid_items from anon, authenticated;

-- ---------------------------------------------------------------------
-- 4. CONTENT (syllabus / DSA / sheets / companies, editable by admin)
-- ---------------------------------------------------------------------
create table if not exists public.content (
  id         text primary key,
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id) on delete set null
);
alter table public.content enable row level security;
drop policy if exists "content: public read" on public.content;
create policy "content: public read" on public.content for select using (true);
revoke insert, update, delete on public.content from anon, authenticated;

-- ---------------------------------------------------------------------
-- 5. GROUPS (friend leaderboards via invite code) — RPC access only
-- ---------------------------------------------------------------------
create table if not exists public.groups (
  id         uuid primary key default gen_random_uuid(),
  name       text not null check (char_length(name) between 1 and 40),
  code       text not null unique,
  owner_id   uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);
create table if not exists public.group_members (
  group_id  uuid not null references public.groups(id) on delete cascade,
  user_id   uuid not null references auth.users(id) on delete cascade,
  joined_at timestamptz not null default now(),
  primary key (group_id, user_id)
);
create index if not exists group_members_user_idx on public.group_members(user_id);
alter table public.groups        enable row level security;   -- no policies: only definer functions touch these
alter table public.group_members enable row level security;
revoke all on public.groups, public.group_members from anon, authenticated;

-- ---------------------------------------------------------------------
-- 6. AI USAGE (per-user rate limit for the Groq proxy)
-- ---------------------------------------------------------------------
create table if not exists public.ai_usage (
  id         bigserial primary key,
  user_id    uuid not null references auth.users(id) on delete cascade,
  feature    text not null,
  created_at timestamptz not null default now()
);
create index if not exists ai_usage_user_time_idx on public.ai_usage(user_id, created_at desc);
alter table public.ai_usage enable row level security;          -- no policies: RPC only
revoke all on public.ai_usage from anon, authenticated;

-- =====================================================================
--  TRIGGERS
-- =====================================================================

-- New auth user → profile + empty progress row.
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, display_name, avatar_url)
  values (
    new.id,
    left(coalesce(nullif(new.raw_user_meta_data->>'full_name',''),
                  nullif(new.raw_user_meta_data->>'name',''),
                  nullif(split_part(coalesce(new.email,''),'@',1),''),
                  'Student'), 40),
    new.raw_user_meta_data->>'avatar_url'
  )
  on conflict (id) do nothing;
  insert into public.progress (user_id) values (new.id) on conflict (user_id) do nothing;
  return new;
end $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Recompute leaderboard stats from the saved state on every write.
-- Mirrors earnedXp() in js/state.js: 20 per mastered topic, 10/20/30 per
-- solved E/M/H problem, plus bonus XP (capped at the earned amount).
create or replace function public.progress_compute_stats()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_topics jsonb; v_probs jsonb; v_days jsonb;
  t_xp int; t_cnt int; p_xp int; p_cnt int; v_bonus int; v_earned int; v_active int;
begin
  v_topics := case when jsonb_typeof(new.state->'topics')   = 'object' then new.state->'topics'   else '{}'::jsonb end;
  v_probs  := case when jsonb_typeof(new.state->'problems') = 'object' then new.state->'problems' else '{}'::jsonb end;
  v_days   := case when jsonb_typeof(new.state->'days')     = 'object' then new.state->'days'     else '{}'::jsonb end;

  select coalesce(sum(v.xp),0), count(v.key) into t_xp, t_cnt
    from jsonb_each(v_topics) e
    join public.valid_items v on v.kind = 't' and v.key = e.key
   where e.value->>'s' = '2';

  select coalesce(sum(v.xp),0), count(v.key) into p_xp, p_cnt
    from jsonb_each(v_probs) e
    join public.valid_items v on v.kind = 'p' and v.key = e.key
   where e.value->>'s' = '2';

  v_bonus := case when jsonb_typeof(new.state->'bonusXp') = 'number'
                  then least(greatest((new.state->>'bonusXp')::numeric, 0), 1000000)::int
                  else 0 end;
  v_earned := t_xp + p_xp;

  new.xp              := v_earned + least(v_bonus, v_earned);
  new.solved          := p_cnt;
  new.topics_mastered := t_cnt;
  new.level           := floor((1 + sqrt(1 + 4.0 * new.xp / 60)) / 2)::int;   -- inverse of xpToReach()
  select count(*) into v_active from jsonb_each(v_days);
  new.streak          := least(greatest(coalesce(new.streak,0),0), v_active);
  new.updated_at      := now();
  return new;
end $$;

drop trigger if exists progress_stats on public.progress;
create trigger progress_stats
  before insert or update on public.progress
  for each row execute function public.progress_compute_stats();

-- =====================================================================
--  RPC FUNCTIONS
-- =====================================================================

-- Global leaderboard: top N plus the caller's own row (even if outside top N).
create or replace function public.leaderboard_global(p_limit int default 50)
returns table(rank bigint, user_id uuid, display_name text, avatar_url text,
              xp int, level int, streak int, solved int, is_me boolean)
language sql stable security definer set search_path = public as $$
  select * from (
    select rank() over (order by p.xp desc) as rank,
           p.user_id, pr.display_name, pr.avatar_url,
           p.xp, p.level, p.streak, p.solved,
           p.user_id = auth.uid() as is_me
      from public.progress p
      join public.profiles pr on pr.id = p.user_id
     where pr.show_on_leaderboard or p.user_id = auth.uid()
  ) x
  where auth.uid() is not null
    and (x.rank <= least(greatest(p_limit,1),100) or x.is_me)
  order by x.rank, x.display_name
  limit 101;
$$;

-- Group leaderboard: only for members of that group.
create or replace function public.leaderboard_group(p_group uuid)
returns table(rank bigint, user_id uuid, display_name text, avatar_url text,
              xp int, level int, streak int, solved int, is_me boolean)
language sql stable security definer set search_path = public as $$
  select rank() over (order by p.xp desc),
         p.user_id, pr.display_name, pr.avatar_url,
         p.xp, p.level, p.streak, p.solved,
         p.user_id = auth.uid()
    from public.group_members m
    join public.progress p  on p.user_id = m.user_id
    join public.profiles pr on pr.id     = m.user_id
   where m.group_id = p_group
     and exists (select 1 from public.group_members me
                  where me.group_id = p_group and me.user_id = auth.uid())
   order by p.xp desc, pr.display_name;
$$;

create or replace function public.my_groups()
returns table(id uuid, name text, code text, members bigint, is_owner boolean)
language sql stable security definer set search_path = public as $$
  select g.id, g.name, g.code,
         (select count(*) from public.group_members m2 where m2.group_id = g.id),
         g.owner_id = auth.uid()
    from public.groups g
    join public.group_members m on m.group_id = g.id and m.user_id = auth.uid()
   order by g.created_at;
$$;

create or replace function public.create_group(p_name text)
returns table(id uuid, name text, code text)
language plpgsql security definer set search_path = public as $$
declare v_id uuid; v_code text; v_name text := btrim(coalesce(p_name,''));
begin
  if auth.uid() is null then raise exception 'Login required' using errcode = '42501'; end if;
  if char_length(v_name) not between 1 and 40 then raise exception 'Group name must be 1-40 characters'; end if;
  if (select count(*) from public.groups g where g.owner_id = auth.uid()) >= 10 then
    raise exception 'You can own at most 10 groups';
  end if;
  loop
    v_code := upper(substr(md5(gen_random_uuid()::text), 1, 6));
    begin
      insert into public.groups(name, code, owner_id) values (v_name, v_code, auth.uid()) returning groups.id into v_id;
      exit;
    exception when unique_violation then
      null;  -- extremely rare code collision → loop and try another code
    end;
  end loop;
  insert into public.group_members(group_id, user_id) values (v_id, auth.uid());
  return query select v_id, v_name, v_code;
end $$;

create or replace function public.join_group(p_code text)
returns table(id uuid, name text, code text)
language plpgsql security definer set search_path = public as $$
declare g public.groups;
begin
  if auth.uid() is null then raise exception 'Login required' using errcode = '42501'; end if;
  select * into g from public.groups where groups.code = upper(btrim(coalesce(p_code,'')));
  if g.id is null then raise exception 'No group found with that code'; end if;
  if (select count(*) from public.group_members m where m.group_id = g.id) >= 200 then
    raise exception 'This group is full';
  end if;
  insert into public.group_members(group_id, user_id) values (g.id, auth.uid()) on conflict do nothing;
  return query select g.id, g.name, g.code;
end $$;

create or replace function public.leave_group(p_group uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  delete from public.group_members where group_id = p_group and user_id = auth.uid();
  -- Delete groups that became empty.
  delete from public.groups g where g.id = p_group
     and not exists (select 1 from public.group_members m where m.group_id = g.id);
end $$;

-- AI rate limit: 30 calls per user per rolling hour. Returns true if allowed.
create or replace function public.ai_take_quota(p_feature text)
returns boolean language plpgsql security definer set search_path = public as $$
declare n int;
begin
  if auth.uid() is null then return false; end if;
  select count(*) into n from public.ai_usage
   where user_id = auth.uid() and created_at > now() - interval '1 hour';
  if n >= 30 then return false; end if;
  insert into public.ai_usage(user_id, feature) values (auth.uid(), left(coalesce(p_feature,'?'), 20));
  return true;
end $$;

-- Admin: publish the content bundle and rebuild the XP lookup table.
-- p_data = { subjects:[...], dsa:[...], sheets:{...}, companies:[...] }
create or replace function public.admin_publish_content(p_data jsonb)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare v_ts timestamptz;
begin
  if not exists (select 1 from public.profiles where id = auth.uid() and is_admin) then
    raise exception 'Admin only' using errcode = '42501';
  end if;
  if jsonb_typeof(p_data->'subjects')  is distinct from 'array'
  or jsonb_typeof(p_data->'dsa')       is distinct from 'array'
  or jsonb_typeof(p_data->'companies') is distinct from 'array'
  or jsonb_typeof(p_data->'sheets')    is distinct from 'object' then
    raise exception 'Content must contain subjects[], dsa[], companies[] and sheets{}';
  end if;

  insert into public.content(id, data, updated_at, updated_by)
  values ('main', p_data, now(), auth.uid())
  on conflict (id) do update set data = excluded.data, updated_at = excluded.updated_at, updated_by = excluded.updated_by
  returning updated_at into v_ts;

  delete from public.valid_items where true;
  -- Syllabus topics (+20)
  insert into public.valid_items(kind, key, xp)
  select 't', t->>'id', 20
    from jsonb_array_elements(p_data->'subjects') s,
         jsonb_array_elements(s->'topics') t
   where t->>'id' is not null
  on conflict do nothing;
  -- DSA folder theory topics use synthetic id 'dsat-<folder>' (+20)
  insert into public.valid_items(kind, key, xp)
  select 't', 'dsat-' || (f->>'id'), 20
    from jsonb_array_elements(p_data->'dsa') f
   where f->>'id' is not null
  on conflict do nothing;
  -- DSA folder problems (E/M/H → 10/20/30). Inserted first so they win, like PROB_META.
  insert into public.valid_items(kind, key, xp)
  select 'p', p->>'s', case p->>'d' when 'H' then 30 when 'M' then 20 else 10 end
    from jsonb_array_elements(p_data->'dsa') f,
         jsonb_array_elements(f->'problems') p
   where p->>'s' is not null
  on conflict do nothing;
  -- Sheet problems: groups = [[groupName, [[name, diff, slug], ...]], ...]
  insert into public.valid_items(kind, key, xp)
  select 'p', pr->>2, case pr->>1 when 'H' then 30 when 'M' then 20 else 10 end
    from jsonb_each(p_data->'sheets') sh,
         jsonb_array_elements(sh.value->'groups') g,
         jsonb_array_elements(g->1) pr
   where pr->>2 is not null
  on conflict do nothing;

  -- Re-run the stats trigger so existing leaderboard numbers use the new table.
  update public.progress set state = state where true;
  return v_ts;
end $$;

-- ---------------------------------------------------------------------
-- Function permissions: logged-in users only.
-- ---------------------------------------------------------------------
revoke execute on function public.leaderboard_global(int)          from public, anon;
revoke execute on function public.leaderboard_group(uuid)          from public, anon;
revoke execute on function public.my_groups()                      from public, anon;
revoke execute on function public.create_group(text)               from public, anon;
revoke execute on function public.join_group(text)                 from public, anon;
revoke execute on function public.leave_group(uuid)                from public, anon;
revoke execute on function public.ai_take_quota(text)              from public, anon;
revoke execute on function public.admin_publish_content(jsonb)     from public, anon;

grant execute on function public.leaderboard_global(int)      to authenticated;
grant execute on function public.leaderboard_group(uuid)      to authenticated;
grant execute on function public.my_groups()                  to authenticated;
grant execute on function public.create_group(text)           to authenticated;
grant execute on function public.join_group(text)             to authenticated;
grant execute on function public.leave_group(uuid)            to authenticated;
grant execute on function public.ai_take_quota(text)          to authenticated;
grant execute on function public.admin_publish_content(jsonb) to authenticated;

-- ---------------------------------------------------------------------
-- Backfill: create profile/progress rows for users who signed up before
-- this schema existed (no-op on a fresh project).
-- ---------------------------------------------------------------------
insert into public.profiles (id, display_name)
select u.id, left(coalesce(nullif(split_part(coalesce(u.email,''),'@',1),''),'Student'),40)
  from auth.users u
on conflict (id) do nothing;
insert into public.progress (user_id) select u.id from auth.users u on conflict (user_id) do nothing;

-- =====================================================================
--  AFTER RUNNING: make yourself admin (replace the email), then open
--  admin.html and click "Publish bundled content".
--
--  update public.profiles set is_admin = true
--   where id = (select id from auth.users where email = 'you@example.com');
-- =====================================================================
