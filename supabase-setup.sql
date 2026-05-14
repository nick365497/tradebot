-- ─────────────────────────────────────────────────────────
-- TradeBot — Supabase SQL Setup
-- Run this in Supabase → SQL Editor → New Query → Run
-- ─────────────────────────────────────────────────────────

-- 1. Trades table — stores every buy/sell order
create table if not exists trades (
  id              uuid default gen_random_uuid() primary key,
  user_id         uuid references auth.users on delete cascade,
  ticker          text not null,
  side            text not null check (side in ('buy', 'sell')),
  qty             integer not null,
  price           numeric(10, 4),
  order_type      text default 'market',
  status          text default 'simulated',
  alpaca_order_id text,
  created_at      timestamptz default now()
);

-- 2. Only let users see their own trades (Row Level Security)
alter table trades enable row level security;

create policy "Users see own trades"
  on trades for select
  using (auth.uid() = user_id);

create policy "Users insert own trades"
  on trades for insert
  with check (auth.uid() = user_id);

-- 3. Scan results table — stores AI decisions per scan
create table if not exists scan_results (
  id          uuid default gen_random_uuid() primary key,
  user_id     uuid references auth.users on delete cascade,
  ticker      text not null,
  decision    text not null check (decision in ('BUY', 'SELL', 'HOLD')),
  confidence  integer,
  reason      text,
  scanned_at  timestamptz default now()
);

alter table scan_results enable row level security;

create policy "Users see own scans"
  on scan_results for select
  using (auth.uid() = user_id);

create policy "Users insert own scans"
  on scan_results for insert
  with check (auth.uid() = user_id);
