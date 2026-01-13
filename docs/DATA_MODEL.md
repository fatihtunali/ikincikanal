# DATA_MODEL.md
# IKINCI KANAL — Database & Cache Schema

This document defines the database tables and Redis structures required for the backend implementation.

---

## 1. PostgreSQL Tables

### 1.1 Users

```sql
CREATE TABLE users (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    handle          VARCHAR(32) NOT NULL UNIQUE,
    full_handle     VARCHAR(128) NOT NULL UNIQUE,  -- handle@server.com
    home_server     VARCHAR(255) NOT NULL,
    display_name    VARCHAR(64),
    password_hash   VARCHAR(255),  -- NULL if passkey-only user
    status          VARCHAR(20) NOT NULL DEFAULT 'active',  -- active, suspended

    -- Settings (JSONB for flexibility)
    settings        JSONB NOT NULL DEFAULT '{}',

    -- Privacy policy acceptance
    accepted_privacy_version VARCHAR(20),

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_handle ON users(handle);
CREATE INDEX idx_users_full_handle ON users(full_handle);
```

### 1.2 Devices

```sql
CREATE TABLE devices (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    device_name         VARCHAR(64) NOT NULL,
    registration_id     INTEGER NOT NULL,
    identity_key_pub    TEXT NOT NULL,  -- Base64 Ed25519 public key

    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_active_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    revoked_at          TIMESTAMPTZ,
    revocation_reason   VARCHAR(50),  -- user_initiated, admin_security, nuke

    CONSTRAINT unique_user_registration UNIQUE (user_id, registration_id)
);

CREATE INDEX idx_devices_user_id ON devices(user_id);
CREATE INDEX idx_devices_user_active ON devices(user_id) WHERE revoked_at IS NULL;
```

### 1.3 Passkeys (WebAuthn Credentials)

```sql
CREATE TABLE passkeys (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    credential_id       TEXT NOT NULL UNIQUE,  -- Base64URL
    public_key          TEXT NOT NULL,         -- Base64 COSE key
    counter             BIGINT NOT NULL DEFAULT 0,
    transports          TEXT[],  -- ['internal', 'usb', 'ble', 'nfc', 'hybrid']
    authenticator_type  VARCHAR(20),  -- platform, cross-platform
    device_name         VARCHAR(64),  -- User-friendly label

    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_used_at        TIMESTAMPTZ
);

CREATE INDEX idx_passkeys_user_id ON passkeys(user_id);
CREATE INDEX idx_passkeys_credential_id ON passkeys(credential_id);
```

### 1.4 Refresh Tokens

```sql
CREATE TABLE refresh_tokens (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    device_id       UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,
    token_hash      VARCHAR(64) NOT NULL UNIQUE,  -- SHA256 hash

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at      TIMESTAMPTZ NOT NULL,
    revoked_at      TIMESTAMPTZ,

    -- Rotation tracking
    previous_token_id UUID REFERENCES refresh_tokens(id),
    rotated_at      TIMESTAMPTZ
);

CREATE INDEX idx_refresh_tokens_user_id ON refresh_tokens(user_id);
CREATE INDEX idx_refresh_tokens_device_id ON refresh_tokens(device_id);
CREATE INDEX idx_refresh_tokens_hash ON refresh_tokens(token_hash);
```

### 1.5 Signed PreKeys

```sql
CREATE TABLE signed_prekeys (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    device_id       UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,
    key_id          INTEGER NOT NULL,
    public_key      TEXT NOT NULL,  -- Base64 X25519
    signature       TEXT NOT NULL,  -- Base64 Ed25519 signature

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT unique_device_signed_prekey UNIQUE (device_id, key_id)
);

CREATE INDEX idx_signed_prekeys_device_id ON signed_prekeys(device_id);
```

### 1.6 One-Time PreKeys

```sql
CREATE TABLE one_time_prekeys (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    device_id       UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,
    key_id          INTEGER NOT NULL,
    public_key      TEXT NOT NULL,  -- Base64 X25519

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    consumed_at     TIMESTAMPTZ,  -- NULL until used

    CONSTRAINT unique_device_otp_key UNIQUE (device_id, key_id)
);

CREATE INDEX idx_otp_device_available ON one_time_prekeys(device_id)
    WHERE consumed_at IS NULL;
```

### 1.7 Message Queue

```sql
CREATE TABLE message_queue (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    server_message_id   UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),

    -- Recipient
    to_user_id          UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    to_device_id        UUID REFERENCES devices(id) ON DELETE CASCADE,  -- NULL = all devices

    -- Sender (NULL for sealed sender)
    from_user_id        UUID REFERENCES users(id) ON DELETE SET NULL,
    from_device_id      UUID REFERENCES devices(id) ON DELETE SET NULL,

    -- Message data
    client_message_id   UUID NOT NULL,
    ciphertext          TEXT NOT NULL,
    envelope_type       VARCHAR(30) NOT NULL,  -- prekey_message, signal_message, sealed_sender

    -- Timestamps & TTL
    sent_at             TIMESTAMPTZ NOT NULL,
    received_at         TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at          TIMESTAMPTZ NOT NULL,  -- Server TTL (default: +7 days)

    -- Disappearing (client-side, informational)
    disappearing_seconds INTEGER,

    -- Deduplication
    idempotency_key     VARCHAR(128),

    CONSTRAINT unique_idempotency UNIQUE (from_device_id, client_message_id)
);

CREATE INDEX idx_mq_to_user ON message_queue(to_user_id);
CREATE INDEX idx_mq_to_device ON message_queue(to_device_id);
CREATE INDEX idx_mq_expires ON message_queue(expires_at);
CREATE INDEX idx_mq_idempotency ON message_queue(idempotency_key) WHERE idempotency_key IS NOT NULL;
```

### 1.8 Delivery Tokens (Sealed Sender)

```sql
CREATE TABLE delivery_tokens (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    token_hash          VARCHAR(64) NOT NULL UNIQUE,  -- SHA256 of token

    -- Sender restriction
    for_sender_type     VARCHAR(20) NOT NULL,  -- user_id, handle, server_domain
    for_sender_value    VARCHAR(255) NOT NULL,

    -- Constraints
    max_payload_bytes   INTEGER NOT NULL DEFAULT 65536,
    require_pow         BOOLEAN NOT NULL DEFAULT FALSE,

    -- Lifecycle
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at          TIMESTAMPTZ NOT NULL,
    used_at             TIMESTAMPTZ  -- NULL until used (single-use)
);

CREATE INDEX idx_dt_user_id ON delivery_tokens(user_id);
CREATE INDEX idx_dt_token_hash ON delivery_tokens(token_hash);
CREATE INDEX idx_dt_expires ON delivery_tokens(expires_at);
```

### 1.9 Call Events

```sql
CREATE TABLE call_events (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id        UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
    call_id         UUID NOT NULL,

    -- Participants
    from_user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    from_device_id  UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,
    to_user_id      UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    to_device_id    UUID REFERENCES devices(id) ON DELETE CASCADE,

    -- Event data
    event_type      VARCHAR(20) NOT NULL,  -- invite, answer, ice, hangup, reject, busy
    encrypted_payload TEXT NOT NULL,

    -- Timestamps
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    received_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at      TIMESTAMPTZ NOT NULL,  -- Default: +5 min
    acked_at        TIMESTAMPTZ
);

CREATE INDEX idx_ce_to_user ON call_events(to_user_id);
CREATE INDEX idx_ce_call_id ON call_events(call_id);
CREATE INDEX idx_ce_expires ON call_events(expires_at);
```

### 1.10 Push Tokens

```sql
CREATE TABLE push_tokens (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    device_id       UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,

    provider        VARCHAR(20) NOT NULL,  -- fcm, apns, unified_push
    token           TEXT NOT NULL,
    endpoint        TEXT,  -- For unified_push
    app_bundle_id   VARCHAR(255),

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT unique_device_push UNIQUE (device_id)
);

CREATE INDEX idx_push_device_id ON push_tokens(device_id);
```

### 1.11 Federation Servers

```sql
CREATE TABLE federation_servers (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    handle          VARCHAR(255) NOT NULL UNIQUE,  -- @otherserver.com
    base_url        TEXT NOT NULL,

    -- Current preferred key
    preferred_key_id VARCHAR(50),

    -- Status
    status          VARCHAR(20) NOT NULL DEFAULT 'unknown',  -- online, offline, unreachable
    last_seen_at    TIMESTAMPTZ,
    last_error      TEXT,

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_fed_handle ON federation_servers(handle);
```

### 1.12 Federation Server Keys

```sql
CREATE TABLE federation_server_keys (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    server_id       UUID NOT NULL REFERENCES federation_servers(id) ON DELETE CASCADE,
    key_id          VARCHAR(50) NOT NULL,
    public_key      TEXT NOT NULL,  -- Base64 Ed25519
    status          VARCHAR(20) NOT NULL DEFAULT 'active',  -- active, deprecated

    not_before      TIMESTAMPTZ,
    not_after       TIMESTAMPTZ,

    fetched_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT unique_server_key UNIQUE (server_id, key_id)
);

CREATE INDEX idx_fsk_server_id ON federation_server_keys(server_id);
```

---

## 2. Redis Structures

### 2.1 Rate Limiting

```
# Per-IP rate limit (login)
rate:ip:login:{ip}          -> counter (TTL: 15 min)

# Per-handle rate limit (login)
rate:handle:login:{handle}  -> counter (TTL: 1 hour)

# Handle lockout tracking
lockout:{handle}            -> JSON { count, until } (TTL: 24 hours)

# TURN credentials rate limit
rate:turn:{userId}          -> counter (TTL: 1 hour, max: 10)

# User resolve rate limit
rate:resolve:ip:{ip}        -> counter (TTL: 1 min, max: 10)
rate:resolve:user:{userId}  -> counter (TTL: 1 min, max: 100)
```

### 2.2 Nonce Cache (Federation Replay Protection)

```
# Federation nonce cache
nonce:{serverOrigin}:{nonce} -> "1" (TTL: 5 min)
```

### 2.3 WebAuthn Challenges

```
# Passkey login challenge
challenge:login:{handle}     -> JSON { challenge, timeout } (TTL: 5 min)

# Passkey registration challenge
challenge:register:{userId}  -> JSON { challenge, timeout } (TTL: 5 min)
```

### 2.4 Nuke Tokens

```
# Emergency nuke token
nuke:{userId}               -> JSON { token, expiresAt } (TTL: 30 sec)
```

### 2.5 Long-Poll Notification

```
# Message arrival pubsub channel
channel:messages:{deviceId}  -> pubsub

# Call event pubsub channel
channel:calls:{deviceId}     -> pubsub
```

### 2.6 Idempotency Keys

```
# Idempotency tracking (message send)
idempotency:{key}           -> serverMessageId (TTL: 24 hours)
```

### 2.7 Session Blacklist (Optional)

```
# Blacklisted JWT IDs (for logout before expiry)
blacklist:jti:{jti}         -> "1" (TTL: token remaining lifetime)
```

---

## 3. Indexes Summary

| Table | Index | Purpose |
|-------|-------|---------|
| users | handle, full_handle | Lookup |
| devices | user_id, active devices | Device listing |
| passkeys | credential_id | WebAuthn verify |
| refresh_tokens | token_hash | Token lookup |
| message_queue | to_user_id, expires_at | Message delivery, cleanup |
| delivery_tokens | token_hash, expires_at | Token validation, cleanup |
| call_events | to_user_id, expires_at | Event delivery, cleanup |

---

## 4. Cleanup Jobs

### 4.1 Message Queue TTL Cleanup

```sql
-- Run every 1 minute
DELETE FROM message_queue WHERE expires_at < NOW();
```

### 4.2 Call Events TTL Cleanup

```sql
-- Run every 1 minute
DELETE FROM call_events WHERE expires_at < NOW();
```

### 4.3 Expired Delivery Tokens Cleanup

```sql
-- Run every 5 minutes
DELETE FROM delivery_tokens WHERE expires_at < NOW();
```

### 4.4 Consumed One-Time PreKeys Cleanup

```sql
-- Run every hour (keep consumed keys for 24h for debugging)
DELETE FROM one_time_prekeys
WHERE consumed_at < NOW() - INTERVAL '24 hours';
```

### 4.5 Expired Refresh Tokens Cleanup

```sql
-- Run every hour
DELETE FROM refresh_tokens WHERE expires_at < NOW();
```

---

## 5. Migration Strategy

1. **Initial**: Create all tables with proper indexes
2. **Seed**: Insert server's own federation record
3. **Keys**: Generate initial federation keypair

```sql
-- Server identity seed
INSERT INTO federation_servers (handle, base_url, status)
VALUES ('@ikincikanal.com', 'https://api.ikincikanal.com', 'online');
```

---

*This document is part of the implementation specification.*
*Last updated: 2026-01-13*
