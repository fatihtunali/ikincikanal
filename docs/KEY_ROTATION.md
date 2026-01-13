# KEY_ROTATION.md
# IKINCI KANAL — Key Rotation Procedures

This document provides step-by-step procedures for rotating cryptographic keys.
Follow these procedures during routine maintenance or security incidents.

---

## 1. Key Inventory

| Key Type | Location | Rotation Period | Compromise Impact |
|----------|----------|-----------------|-------------------|
| Federation Ed25519 | Server config | 6 months | Server impersonation |
| TURN HMAC Secret | TURN server | 30 days | Call interception |
| JWT Signing Key | Auth service | 90 days | Token forgery |
| Device Identity Key | Client device | Never (revoke instead) | Device impersonation |
| User Identity Key | Client device | Never (revoke instead) | Full account compromise |

---

## 2. Federation Key Rotation

### 2.1 Routine Rotation (Zero-Downtime)

**Timeline:** 7 days total

**Day 1 — Add New Key**
```bash
# Generate new Ed25519 keypair
openssl genpkey -algorithm ed25519 -out federation-key-2026-02.pem
openssl pkey -in federation-key-2026-02.pem -pubout -out federation-key-2026-02.pub

# Assign key ID
KEY_ID="key-2026-02"
```

Update `/.well-known/ikincikanal-server`:
```json
{
  "serverDomain": "ikincikanal.com",
  "publicKeys": [
    {
      "keyId": "key-2026-01",
      "algorithm": "Ed25519",
      "publicKey": "<OLD_KEY_BASE64>",
      "status": "active"
    },
    {
      "keyId": "key-2026-02",
      "algorithm": "Ed25519",
      "publicKey": "<NEW_KEY_BASE64>",
      "status": "active"
    }
  ],
  "preferredKeyId": "key-2026-01"
}
```

**Day 2 — Wait for Cache Refresh**
- Federation peers cache discovery for up to 24 hours
- Monitor logs for signature verification errors

**Day 3 — Switch Preferred Key**
```json
{
  "preferredKeyId": "key-2026-02"
}
```
- Outbound requests now use new key
- Inbound requests accept both keys

**Day 7 — Remove Old Key**
```json
{
  "publicKeys": [
    {
      "keyId": "key-2026-02",
      "algorithm": "Ed25519",
      "publicKey": "<NEW_KEY_BASE64>",
      "status": "active"
    }
  ],
  "preferredKeyId": "key-2026-02"
}
```

**Verification:**
```bash
# Test federation health
curl -X POST https://peer-server.com/federation/inbox \
  -H "X-Server-Origin: https://ikincikanal.com" \
  -H "X-Server-Key-Id: key-2026-02" \
  -H "X-Timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -H "X-Nonce: $(openssl rand -hex 16)" \
  -H "X-Signature: <SIGNATURE>"
```

### 2.2 Emergency Rotation (Key Compromise)

**Timeline:** Immediate

**Step 1 — Revoke Immediately**
```bash
# Remove compromised key from discovery
# Update /.well-known/ikincikanal-server with ONLY new key
```

**Step 2 — Generate and Deploy**
```bash
openssl genpkey -algorithm ed25519 -out federation-key-emergency.pem
# Deploy to all server instances immediately
```

**Step 3 — Notify Federation Peers**
```bash
# Send out-of-band notification to known peers
# Email / Secure channel to peer operators
```

**Step 4 — Incident Log**
```markdown
## Incident: Federation Key Compromise
- **Date:** 2026-01-13T15:30:00Z
- **Detection:** [How was it detected]
- **Scope:** [What was potentially exposed]
- **Action:** Key revoked, new key deployed
- **Notification:** Peers notified via [channel]
```

---

## 3. TURN HMAC Secret Rotation

### 3.1 Routine Rotation

**Timeline:** 30 days, overlap period 24 hours

**Step 1 — Generate New Secret**
```bash
NEW_TURN_SECRET=$(openssl rand -base64 32)
```

**Step 2 — Configure Dual Secrets**
```yaml
# TURN server config (coturn example)
static-auth-secret=OLD_SECRET
static-auth-secret-2=NEW_SECRET
```

**Step 3 — Update Backend**
```typescript
// Environment variable
TURN_HMAC_SECRET_PRIMARY=NEW_SECRET
TURN_HMAC_SECRET_SECONDARY=OLD_SECRET  // Accept for 24h
```

**Step 4 — Remove Old Secret (after 24h)**
```yaml
static-auth-secret=NEW_SECRET
# Remove static-auth-secret-2
```

### 3.2 Emergency Rotation

```bash
# Immediate replacement, active calls may drop
NEW_TURN_SECRET=$(openssl rand -base64 32)
# Update TURN server and backend simultaneously
# Accept brief service disruption
```

---

## 4. JWT Signing Key Rotation

### 4.1 Routine Rotation

**Timeline:** 90 days, overlap period 7 days

**Step 1 — Generate New Key**
```bash
# For RS256
openssl genrsa -out jwt-key-2026-02.pem 2048
openssl rsa -in jwt-key-2026-02.pem -pubout -out jwt-key-2026-02.pub

# For EdDSA (recommended)
openssl genpkey -algorithm ed25519 -out jwt-key-2026-02.pem
```

**Step 2 — Deploy with Key ID**
```typescript
// JWT config
const JWT_KEYS = {
  'jwt-2026-01': { private: OLD_KEY, public: OLD_PUB },
  'jwt-2026-02': { private: NEW_KEY, public: NEW_PUB },
};
const JWT_SIGNING_KEY_ID = 'jwt-2026-02';  // New tokens use this
const JWT_VERIFY_KEY_IDS = ['jwt-2026-01', 'jwt-2026-02'];  // Accept both
```

**Step 3 — Wait for Token Expiry**
- Access tokens: 15 min max
- Refresh tokens: Force rotation on next use
- After 7 days, remove old key from verify list

### 4.2 Emergency Rotation

```typescript
// Invalidate ALL existing tokens
const JWT_KEYS = {
  'jwt-emergency': { private: NEW_KEY, public: NEW_PUB },
};
const JWT_SIGNING_KEY_ID = 'jwt-emergency';
const JWT_VERIFY_KEY_IDS = ['jwt-emergency'];  // Old tokens invalid

// Users will need to re-authenticate
```

---

## 5. Device Key Revocation

Device keys are NEVER rotated — they are REVOKED.

### 5.1 User-Initiated (Lost Device)

```http
DELETE /devices/{deviceId}
Authorization: Bearer <token_from_another_device>
```

**Backend Actions:**
1. Mark device as `revokedAt = NOW()`
2. Delete device's prekeys from key server
3. Reject any messages signed by revoked device
4. Notify other devices of revocation

### 5.2 Admin-Initiated (Compromise Detected)

```sql
-- Direct database action (emergency)
UPDATE devices
SET revoked_at = NOW(),
    revocation_reason = 'admin_security'
WHERE device_id = 'xxx';

-- Delete associated keys
DELETE FROM prekeys WHERE device_id = 'xxx';
DELETE FROM signed_prekeys WHERE device_id = 'xxx';
```

### 5.3 Revoke All Devices (Account Compromise)

```http
POST /devices/revoke-all-including-current
Authorization: Bearer <token>
X-Device-Key-Signature: <signature_of_request_body>
```

**This triggers:**
1. All devices marked revoked
2. All sessions invalidated
3. All tokens blacklisted
4. User must re-register devices

---

## 6. User Identity Key (Nuclear Option)

User identity keys should NEVER be rotated under normal circumstances.
This is equivalent to creating a new identity.

### 6.1 When Required

- Private key confirmed leaked
- Device with identity key compromised AND no other devices
- User explicitly requests identity reset

### 6.2 Procedure

```http
POST /me/nuke
Authorization: Bearer <token>
X-Device-Key-Signature: <signature>

{
  "mode": "instant",
  "confirmation": "DELETE_ALL_MY_DATA"
}
```

**User must then:**
1. Register as new user (same handle if available)
2. Re-establish sessions with all contacts
3. Contacts will see "identity key changed" warning

---

## 7. Rotation Schedule Template

```markdown
## Monthly Security Tasks

### Week 1
- [ ] Check TURN secret age (rotate if > 25 days)
- [ ] Review failed signature logs

### Week 2
- [ ] Check JWT key age (rotate if > 80 days)
- [ ] Audit revoked devices list

### Week 3
- [ ] Check federation key age (rotate if > 5 months)
- [ ] Test federation with staging peer

### Week 4
- [ ] Security log review
- [ ] Update this rotation log
```

---

## 8. Incident Response Checklist

### Key Compromise Detected

- [ ] Identify which key type is compromised
- [ ] Determine compromise scope (when, how long exposed)
- [ ] Execute emergency rotation for that key type
- [ ] Check logs for unauthorized usage
- [ ] Notify affected parties (users, federation peers)
- [ ] Document incident timeline
- [ ] Post-incident review (how to prevent recurrence)

### Signs of Key Compromise

| Indicator | Possible Compromise |
|-----------|---------------------|
| Unknown signatures accepted | Federation key leaked |
| Unauthorized TURN usage | TURN secret leaked |
| Forged tokens in logs | JWT key leaked |
| Messages from revoked device | Device key not properly revoked |

---

## 9. Key Storage Security

### Server Keys

- Store in environment variables or secrets manager (not in code)
- Use HashiCorp Vault, AWS Secrets Manager, or similar
- Restrict access to production secrets
- Audit access logs regularly

### Backup Keys

- Encrypted offline backup of federation keys
- Split knowledge: no single person has full access
- Test backup restoration annually

---

*This document is part of the security operations manual.*
*Last updated: 2026-01-13*
IKINCI KANAL – Data Model & Storage Contract

This document defines the backend storage model required to implement the IKINCI KANAL OpenAPI and security contract.

Rule 0 (Non-negotiable):
Server never stores plaintext messages, call media, private keys, or sealed-sender identities.

1) Storage Layers
1.1 PostgreSQL (durable)

Used for:

Accounts, devices, public keys

Passkeys (public key material)

Refresh tokens (hashed)

Delivery tokens (hashed)

Queues (encrypted blobs)

Federation server registry (public keys + status)

1.2 Redis (ephemeral / cache)

Used for:

Nonce replay cache (federation)

WebAuthn challenges (passkey flows)

Rate limiting / abuse counters

Optional long-poll wakeups

Rule: Anything in Redis must be safe to lose (no durable state).

2) PostgreSQL Schema (Suggested)
2.1 users

Stores local account identity (no password if passkey-only user).

Column	Type	Notes
id	uuid (PK)	
handle	text UNIQUE	local handle (without domain)
full_handle	text UNIQUE	handle@ikincikanal.com
home_server	text	domain
display_name	text NULL	
status	text	active/suspended
created_at	timestamptz	
deleted_at	timestamptz NULL	soft delete marker optional

Indexes

UNIQUE(handle)

UNIQUE(full_handle)

2.2 user_settings

User privacy preferences (server-side only for UX; do not log read receipts etc).

Column	Type	Notes
user_id	uuid (PK/FK users)	
default_disappearing_seconds	int NULL	
allow_sealed_sender	boolean	default true
read_receipts	boolean	default false
typing_indicators	boolean	default false
updated_at	timestamptz	
2.3 devices

Each login is device-bound.

Column	Type	Notes
id	uuid (PK)	
user_id	uuid (FK users)	
device_name	text	
registration_id	int	Signal-style
identity_key_pub	bytea	Ed25519 public key (base64 at API layer)
created_at	timestamptz	
last_active_at	timestamptz	update on authenticated calls
revoked_at	timestamptz NULL	

Indexes

(user_id)

(user_id, revoked_at)

2.4 password_credentials (optional)

Only present for password fallback users.

Column	Type	Notes
user_id	uuid (PK/FK users)	
password_hash	text	Argon2id encoded hash
created_at	timestamptz	
rotated_at	timestamptz NULL	

If user is passkey-only: there is no row here.

2.5 passkeys

WebAuthn credentials for a user. Multiple passkeys allowed.

Column	Type	Notes
id	uuid (PK)	
user_id	uuid (FK users)	
credential_id	bytea UNIQUE	raw credential id
public_key	bytea	COSE/PK or raw bytes (impl choice)
sign_count	bigint	counter for replay detection
transports	text[] NULL	["internal","usb",...]
aaguid	uuid NULL	optional
created_at	timestamptz	
last_used_at	timestamptz NULL	

Indexes

UNIQUE(credential_id)

(user_id)

Store public key only. Never store private key material.

2.6 webauthn_challenges (optional durable; prefer Redis)

Normally store in Redis, but can be DB for debugging/audit in strict environments.

Column	Type	Notes
id	uuid (PK)	
user_id	uuid NULL	might be null for unknown handle
challenge	bytea	
purpose	text	login / add_passkey / delete_account
expires_at	timestamptz	TTL 5 min
consumed_at	timestamptz NULL	single-use
created_at	timestamptz	

Preferred: Redis only (see §3).

3) Key Management (Signal-style)
3.1 signed_prekeys
Column	Type	Notes
id	uuid (PK)	
device_id	uuid (FK devices)	
key_id	int	
public_key	bytea	X25519 pub
signature	bytea	Ed25519 signature
created_at	timestamptz	
replaced_at	timestamptz NULL	

Indexes

(device_id)

UNIQUE(device_id, key_id)

3.2 one_time_prekeys
Column	Type	Notes
id	uuid (PK)	
device_id	uuid (FK devices)	
key_id	int	
public_key	bytea	X25519 pub
created_at	timestamptz	
consumed_at	timestamptz NULL	must be set atomically
consumed_by	uuid NULL	(optional) recipient device/user id

Indexes

(device_id, consumed_at)

UNIQUE(device_id, key_id)

Atomic requirement

When serving a bundle, select one unconsumed OTPK and mark consumed_at=now() in the same transaction.

4) Messaging Storage (Encrypted Only)
4.1 message_queue

Queue of undelivered encrypted messages (store-and-forward).

Column	Type	Notes
id	uuid (PK)	serverMessageId
to_user_id	uuid	
to_device_id	uuid	
from_user_id	uuid NULL	null for sealed sender
from_device_id	uuid NULL	null for sealed sender
client_message_id	uuid	dedupe
envelope_type	text	prekey_message/signal_message/sealed_sender
ciphertext	bytea	opaque blob
received_at	timestamptz	
expires_at	timestamptz	server TTL (default 7 days)
acked_at	timestamptz NULL	set on ack
deleted_at	timestamptz NULL	hard delete recommended

Indexes

(to_device_id, received_at)

(to_device_id, expires_at)

UNIQUE(to_device_id, client_message_id) (or include sender device if needed)

Deletion policy

Hard delete after ACK (immediate)

Hard delete after TTL expiry (batch job)

5) Sealed Sender Tokens
5.1 delivery_tokens

Capability tokens for receiving sealed sender messages.

Column	Type	Notes
id	uuid (PK)	
user_id	uuid (FK users)	token owner (recipient)
token_hash	bytea UNIQUE	SHA-256 (or better) of token
scope_type	text	user_id/handle/server_domain
scope_value	text	value to match
max_payload_bytes	int	
require_pow	boolean	
pow_difficulty	int NULL	e.g., 20
expires_at	timestamptz	
used_at	timestamptz NULL	single-use
created_at	timestamptz	

Indexes

UNIQUE(token_hash)

(user_id, expires_at)

(user_id, used_at)

Rules

Store only token hash (never plaintext)

Validate scope before accepting sealed message

Mark used_at atomically on first use

6) Calls (Signaling Only)
6.1 call_events_queue

Encrypted signaling events for WebRTC (invite/answer/ice/hangup).

Column	Type	Notes
id	uuid (PK)	eventId
call_id	uuid	
to_user_id	uuid	
to_device_id	uuid	
from_user_id	uuid	
from_device_id	uuid	
event_type	text	invite/answer/ice/hangup/reject/busy
encrypted_payload	bytea	opaque
received_at	timestamptz	
expires_at	timestamptz	default: received_at + 5 min
acked_at	timestamptz NULL	
deleted_at	timestamptz NULL	

Indexes

(to_device_id, received_at)

(to_device_id, expires_at)

7) Tokens & Sessions
7.1 refresh_tokens

Refresh tokens are device-bound and stored hashed.

Column	Type	Notes
id	uuid (PK)	
user_id	uuid	
device_id	uuid	
token_hash	bytea UNIQUE	store SHA-256(token)
issued_at	timestamptz	
expires_at	timestamptz	
revoked_at	timestamptz NULL	
rotated_from	uuid NULL	previous token id
last_used_at	timestamptz NULL	

Indexes

UNIQUE(token_hash)

(user_id, device_id, revoked_at)

(expires_at)

Rotation rules

Rotate on every refresh

Reuse of an old refresh token ⇒ revoke chain + force re-login

7.2 Access tokens

Prefer stateless JWT for access tokens.

Include jti and deviceId

Optional access_token_blacklist in Redis for logout (short TTL)

8) Federation
8.1 federation_servers

Registry of known federation peers + their public keys.

Column	Type	Notes
id	uuid (PK)	
handle	text	@server.com
base_url	text UNIQUE	
preferred_key_id	text	
status	text	online/offline/unreachable
last_seen_at	timestamptz	
created_at	timestamptz	
8.2 federation_server_keys

Key rotation support.

Column	Type	Notes
id	uuid (PK)	
server_id	uuid (FK federation_servers)	
key_id	text	key-YYYY-MM
public_key	bytea	Ed25519 pub
status	text	active/deprecated
not_before	timestamptz NULL	
not_after	timestamptz NULL	
created_at	timestamptz	

Indexes

UNIQUE(server_id, key_id)

(server_id, status)

9) Ephemeral Storage in Redis (Required)
9.1 Nonce replay cache (federation)

Key: nonce:{origin}:{nonce}

Value: 1

TTL: 300 seconds (5 minutes)

Reject request if key exists.

9.2 WebAuthn challenge cache

Key: webauthn:challenge:{purpose}:{handle}

Value: challenge payload (JSON)

TTL: 300 seconds

Delete on successful verify (single-use)

9.3 Rate limit buckets

Key: rl:{scope}:{key}:{window}

TTL: window size
Examples:

rl:ip:203.0.113.10:60 → 60s window

rl:handle:fatih:900 → 15m window

9.4 Optional: long-poll wakeups

lp:{deviceId} publish/notify channel

Or Redis streams if you want ordering guarantees

10) Data Retention & Deletion
10.1 Queue retention

Messages: TTL default 7 days (expires_at)

Call events: TTL default 5 minutes

Delete on ACK immediately

10.2 Account deletion

Hard delete recommended for minimal data footprint:

users, settings, devices, keys, tokens, queues

Federation notification emitted

10.3 /me/nuke

Must:

revoke refresh tokens

revoke all devices

purge queues

delete account

send federated purge notice

11) Logging Contract (Backend)
Never log

ciphertext, sealedCiphertext, encryptedPayload

token plaintext (refresh/delivery)

X-Signature raw

any key material beyond public keys

OK to log (minimal)

request id

endpoint name

status code

timing

rate-limit triggered (without PII if possible)

12) Minimal SQL DDL Skeleton (Optional)

Exact DDL depends on ORM. This section is intentionally minimal.

Use uuid PKs

Use bytea for binary blobs

Use partial indexes for revoked_at IS NULL patterns where needed

TTL cleanup via cron/job (every minute for call events, hourly for message TTL)

13) Implementation Notes

Use transactions for:

one-time prekey consumption

delivery token single-use marking

refresh token rotation

Use constant-time compare for token hashes

Validate federation fromServer matches X-Server-Origin

This data model is part of the security contract.
If backend storage diverges, update this document first.