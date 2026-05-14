# TradeBot 🤖

AI-powered paper trading platform — 18 stocks, conservative bot, real Alpaca paper trades.

## Stack
- **Next.js** — frontend + API routes
- **Supabase** — auth + trade history database
- **Alpaca** — paper trade execution
- **Claude API** — AI buy/sell/hold decisions with web search

---

## Step 1 — Set up Supabase database

1. Go to [supabase.com](https://supabase.com) → your project
2. Click **SQL Editor** in the left sidebar
3. Click **New Query**
4. Copy everything from `supabase-setup.sql` and paste it
5. Click **Run** — you'll see "Success" messages

---

## Step 2 — Add your environment variables

1. Copy `.env.local.example` to a new file called `.env.local`
2. Fill in all 5 values:

```
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ_YOUR_PUBLISHABLE_KEY
ANTHROPIC_API_KEY=sk-ant-YOUR_KEY
NEXT_PUBLIC_ALPACA_KEY_ID=PK_YOUR_KEY_ID
ALPACA_SECRET_KEY=YOUR_SECRET
```

---

## Step 3 — Push to GitHub

1. Go to [github.com](https://github.com) → New repository → name it `tradebot`
2. Upload ALL these files to that repository
3. Make sure `.env.local` is NOT uploaded (it's in .gitignore)

---

## Step 4 — Deploy on Vercel

1. Go to [vercel.com](https://vercel.com) → New Project
2. Import your `tradebot` GitHub repository
3. Before clicking Deploy, click **Environment Variables** and add all 5 keys from your `.env.local`
4. Click **Deploy** — live in ~60 seconds!
5. Your app is live at `https://tradebot-xxx.vercel.app`

---

## Step 5 — Enable Supabase Auth emails (optional)

In Supabase → Authentication → Email Templates — customize the signup confirmation email.

---

## How it works

- **Login/Signup** — real auth via Supabase
- **Watchlist** — 18 stocks: 4 mega, 3 large, 6 small, 5 penny
- **Scan** — Claude reads live news via web search and decides BUY/SELL/HOLD for each stock
- **Orders** — places real paper trades on Alpaca (or simulates if no keys)
- **Risk** — conservative rules: $1,500 max position, -3% stop-loss, $500 daily loss limit
- **Timer** — auto-scans all 18 stocks on a schedule

---

## ⚠️ Important

- This is PAPER TRADING only — no real money
- Never switch to Alpaca Live without fully testing first
- The AI bot gives suggestions, not financial advice
