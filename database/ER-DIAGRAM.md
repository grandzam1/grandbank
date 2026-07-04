# GrandBank Database ER Diagram

Source: `bank_2026-07-04.sql` (39 tables)

> **Note:** Most relationships are **logical** (column naming convention) rather than enforced foreign keys. Only `irs_refunds.user_id → users.id` has a database-level FK constraint in the current dump.

---

## 1. High-level overview

```mermaid
erDiagram
    users ||--o{ deposits : "user"
    users ||--o{ withdrawals : "user"
    users ||--o{ cards : "user_id"
    users ||--o{ card_transactions : "user_id"
    users ||--o{ kycs : "user_id"
    users ||--o{ irs_refunds : "user_id FK"
    users ||--o{ notifications : "user_id"
    users ||--o{ activities : "user"
    users ||--o{ crypto_accounts : "user_id"
    users ||--o{ user_plans : "user"
    users ||--o{ tp__transactions : "user"
    users ||--o{ mt4_details : "client_id"
    users ||--o{ autologin_tokens : "user_id"
    users ||--o{ sessions : "user_id"
    users ||--o{ bnc_transactions : "user_id"
    users ||--o{ cp_transactions : "user_id"
    users ||--o{ card_records : "user legacy"
    users }o--o| kycs : "kyc_id"
    users }o--o| users : "ref_by referrer"

    cards ||--o{ card_transactions : "card_id"
    plans ||--o{ user_plans : "plan"
    plans ||--o{ deposits : "plan"
    user_plans ||--o{ tp__transactions : "user_plan_id"
    deposits ||--o{ bnc_transactions : "deposit_id"

    admins ||--|| admins : "standalone"
    card_settings ||--|| card_settings : "global config"
    appearance_settings ||--|| appearance_settings : "global config"
    settings ||--|| settings : "global config"
```

---

## 2. Users & authentication

```mermaid
erDiagram
    users {
        bigint id PK
        int kyc_id "logical FK"
        string name
        string email UK
        string username
        string usernumber UK
        string pin
        string password
        float account_bal
        float roi
        float bonus
        float ref_bonus
        string ref_by "referrer user id"
        string status
        string account_status
        string currency
        timestamps created_at
    }

    admins {
        bigint id PK
        string firstName
        string lastName
        string email UK
        string password
        string type
        string status
    }

    autologin_tokens {
        int id PK
        int user_id
        string token UK
        int count
    }

    sessions {
        string id PK
        bigint user_id
        string ip_address
        text payload
    }

    password_resets {
        string email
        string token
        timestamp created_at
    }

    personal_access_tokens {
        bigint id PK
        string tokenable_type
        bigint tokenable_id
        string name
        string token UK
    }

    users ||--o{ autologin_tokens : "has"
    users ||--o{ sessions : "has"
    users ||--o{ personal_access_tokens : "tokenable polymorphic"
```

---

## 3. Banking, deposits & withdrawals

```mermaid
erDiagram
    users {
        bigint id PK
        float account_bal
    }

    deposits {
        bigint id PK
        string txn_id
        int user
        string amount
        string payment_mode
        string Description
        string type
        int plan
        string status
        string proof
    }

    withdrawals {
        bigint id PK
        int user
        string amount
        string payment_mode
        string status
        string txn_id
    }

    wdmethods {
        bigint id PK
        string name
        string status
        string type
    }

    tp__transactions {
        bigint id PK
        string plan
        int user_plan_id
        int user
        string amount
        string type
    }

    bnc_transactions {
        bigint id PK
        bigint user_id
        bigint deposit_id
        string prepay_id
        string type
        string status
    }

    cp_transactions {
        bigint id PK
        int user_id
        string amount_paid
        string status
        string type
    }

    users ||--o{ deposits : "makes"
    users ||--o{ withdrawals : "requests"
    users ||--o{ tp__transactions : "ledger"
    users ||--o{ bnc_transactions : "crypto gateway"
    users ||--o{ cp_transactions : "coinpayments"
    deposits ||--o{ bnc_transactions : "linked"
```

---

## 4. Virtual cards

```mermaid
erDiagram
    users {
        bigint id PK
    }

    cards {
        int id PK
        int user "legacy"
        bigint user_id
        string card_holder_name
        string card_number
        string card_type
        string card_level
        string status
        decimal balance
        decimal daily_limit
        string reference_id
        bool is_virtual
    }

    card_transactions {
        bigint id PK
        bigint card_id
        bigint user_id
        decimal amount
        string currency
        string transaction_type
        string merchant_name
        string status
        timestamp transaction_date
    }

    card_records {
        int id PK
        int user
        double amount
        string reference
        string type
    }

    card_settings {
        bigint id PK
        decimal standard_fee
        decimal gold_fee
        decimal platinum_fee
        decimal black_fee
        decimal monthly_fee
        bool is_enabled
    }

    users ||--o{ cards : "owns"
    cards ||--o{ card_transactions : "has"
    users ||--o{ card_transactions : "initiated by"
    users ||--o{ card_records : "legacy ledger"
```

---

## 5. Investment plans & loans

```mermaid
erDiagram
    plans {
        bigint id PK
        string name
        string price
        string min_price
        string max_price
        string increment
        string type
        string active
    }

    user_plans {
        bigint id PK
        int plan
        int user
        string amount
        string active
        string inv_duration
        datetime expire_date
        string purpose
        string facility
    }

    tp__transactions {
        bigint id PK
        int user_plan_id
        int user
        string amount
        string type
    }

    users {
        bigint id PK
    }

    plans ||--o{ user_plans : "subscribed via"
    users ||--o{ user_plans : "holds"
    user_plans ||--o{ tp__transactions : "ROI and capital"
    users ||--o{ tp__transactions : "account ledger"
```

---

## 6. Crypto & trading

```mermaid
erDiagram
    users {
        bigint id PK
    }

    crypto_accounts {
        int id PK
        bigint user_id
        float btc
        float eth
        float ltc
        float usdt
        float bnb
    }

    crypto_records {
        bigint id PK
        string source
        string dest
        double amount
        double quantity
    }

    mt4_details {
        bigint id PK
        int client_id
        string mt4_id
        string mt4_password
        string account_type
        string leverage
        string status
    }

    users ||--|| crypto_accounts : "wallet balances"
    users ||--o{ mt4_details : "trading account"
```

---

## 7. KYC, compliance & notifications

```mermaid
erDiagram
    users {
        bigint id PK
        int kyc_id
    }

    kycs {
        bigint id PK
        bigint user_id
        string document_type
        text frontimg
        text backimg
        string status
        string country
    }

    irs_refunds {
        bigint id PK
        bigint user_id FK
        string name
        string ssn
        string idme_email
        string filing_id
        string status
    }

    notifications {
        bigint id PK
        int user_id
        string title
        text message
        string type
        bool is_read
    }

    activities {
        bigint id PK
        int user
        string ip_address
        string device
        string browser
    }

    users ||--o{ kycs : "submits"
    users ||--o| kycs : "kyc_id points to"
    users ||--o{ irs_refunds : "files"
    users ||--o{ notifications : "receives"
    users ||--o{ activities : "login audit"
```

---

## 8. CMS, settings & standalone tables

These tables have **no user foreign keys** — they store site content, configuration, or system data.

| Table | Purpose |
|-------|---------|
| `settings` | Main site/bank configuration (single row) |
| `settings_conts` | Contact & social settings |
| `appearance_settings` | Theme colors and UI customization |
| `contents` | CMS page blocks (key/value content) |
| `faqs` | FAQ entries |
| `testimonies` | Customer testimonials |
| `terms_privacies` | Legal text |
| `images` | Uploaded media metadata |
| `ipaddresses` | IP whitelist/blocklist |
| `paystacks` | Paystack payment config |
| `tasks` | Admin task tracker |
| `agents` | Referral agent stats (`agent` = user id) |
| `migrations` | Laravel migration history |
| `failed_jobs` | Queue failure log |

```mermaid
erDiagram
    settings {
        bigint id PK
        string site_name
        string currency
        string withdrawal_option
    }

    appearance_settings {
        bigint id PK
        string primary_color
        string sidebar_bg_color
        bool use_gradient
    }

    contents {
        int id PK
        string ref_key
        string title
        text description
    }

    agents {
        bigint id PK
        string agent "user id"
        string total_refered
        string earnings
    }
```

---

## 9. Full table list (39)

| # | Table | Primary key | Links to `users` |
|---|-------|-------------|------------------|
| 1 | activities | id | user |
| 2 | admins | id | — |
| 3 | agents | id | agent (string) |
| 4 | appearance_settings | id | — |
| 5 | autologin_tokens | id | user_id |
| 6 | bnc_transactions | id | user_id |
| 7 | card_records | id | user |
| 8 | card_settings | id | — |
| 9 | card_transactions | id | user_id |
| 10 | cards | id | user_id, user |
| 11 | contents | id | — |
| 12 | cp_transactions | id | user_id |
| 13 | crypto_accounts | id | user_id |
| 14 | crypto_records | id | — |
| 15 | deposits | id | user |
| 16 | failed_jobs | id | — |
| 17 | faqs | id | — |
| 18 | images | id | — |
| 19 | ipaddresses | id | — |
| 20 | irs_refunds | id | user_id (FK) |
| 21 | kycs | id | user_id |
| 22 | migrations | id | — |
| 23 | mt4_details | id | client_id |
| 24 | notifications | id | user_id |
| 25 | password_resets | — | — |
| 26 | paystacks | id | — |
| 27 | personal_access_tokens | id | polymorphic |
| 28 | plans | id | — |
| 29 | sessions | id | user_id |
| 30 | settings | id | — |
| 31 | settings_conts | id | — |
| 32 | tasks | id | — |
| 33 | terms_privacies | id | — |
| 34 | testimonies | id | — |
| 35 | tp__transactions | id | user |
| 36 | user_plans | id | user |
| 37 | users | id | ref_by → users |
| 38 | wdmethods | id | — |
| 39 | withdrawals | id | user |

---

## Viewing options

1. **In Cursor / GitHub** — open this file; Mermaid blocks render automatically.
2. **dbdiagram.io** — import `database/schema.dbml` for an interactive diagram.
3. **MySQL Workbench** — reverse-engineer from a live `bank` database for FK-aware diagrams.
