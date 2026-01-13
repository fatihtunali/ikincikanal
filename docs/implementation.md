IKINCI KANAL
Implementation Notes & Security Guarantees

This document describes how the IKINCI KANAL protocol should be implemented in practice.
It complements the OpenAPI specification and focuses on security-critical behavior, data handling, and operational assumptions.

1. Scope & Non-Goals
In scope

End-to-end encrypted messaging (Signal-style)

Sealed sender messaging

Federated server architecture

Privacy-first defaults

Emergency data deletion

Encrypted voice/video calling (WebRTC)

Explicit non-goals

Content moderation

Message recovery after device compromise

Guaranteeing deletion on compromised clients

Preventing all metadata leakage (only minimizing it)

Design principle:
If a guarantee cannot be enforced cryptographically, it must not be promised.

2. Trust Model
Client

Considered trusted only until compromised

Holds all private keys

Responsible for encryption, decryption, and disappearing-message enforcement

Server

Honest-but-curious

May be compromised at any time

Must never see plaintext messages or call media

Must store minimal metadata for shortest possible time

Federation Peers

Each server is independently operated

Trust is explicit, not transitive

No global PKI; trust is established per server via public key discovery

3. Cryptography Overview
Identity & Devices

Identity key: Ed25519

Session keys: X25519

Device isolation is mandatory (no shared keys)

Messaging

Signal Protocol primitives:

X3DH (session establishment)

Double Ratchet (forward secrecy)

Each device has:

Identity key

Signed prekey

One-time prekeys

Sealed Sender

Sender identity is encrypted inside the ciphertext

Server cannot associate sender ↔ recipient

Delivery tokens act as capability grants

Voice / Video Calls

WebRTC with DTLS-SRTP

TURN relay recommended by default

Ephemeral TURN credentials (short TTL)

4. Key Storage (Client)
Mobile (iOS / Android)

Private keys stored in:

iOS Secure Enclave / Keychain

Android Keystore (hardware-backed if available)

No plaintext key export

Database encrypted (SQLCipher or equivalent)

Desktop

OS secure key store if available

Otherwise encrypted local store with strong KDF

Key loss

Loss of device = loss of message history

No server-side recovery

5. Authentication
Passkeys (Primary)

WebAuthn / platform authenticators

No shared secrets

Preferred for all new accounts

Passwords (Fallback only)

Stored server-side using Argon2id

Aggressive rate limiting required

Intended for legacy or constrained clients

OPAQUE Roadmap (V2)

Password fallback users will migrate to OPAQUE in V2, matching the OpenAPI security roadmap. After migration, the server stores only an OPAQUE "password file" (verifier) and cannot validate passwords without client participation. This eliminates server-side password exposure entirely.

Tokens

Short-lived access tokens

Refresh tokens bound to device

Token compromise ≠ key compromise

6. Message Lifecycle
Server-side

Receive encrypted payload

Store as opaque blob

Assign TTL (delivery window)

Deliver to device

Delete immediately after ACK or TTL expiry

Client-side

Decrypt message

Persist locally (encrypted)

Apply disappearing timer after read

Securely erase on expiry

Important:
Server TTL ≠ message disappearance guarantee.

7. Disappearing Messages

Enforced only on client

Server never re-sends expired messages

Recipient screenshots, backups, or compromised clients are out of scope

8. Metadata Handling Policy
Server MUST NOT store

Message plaintext

Sender identity for sealed messages

Call media

Long-term message timestamps

Server MAY temporarily store

Encrypted blobs

Device routing info

Rate-limit counters

Federation delivery state

Logging

Logs must never contain:

Ciphertext

Keys

User content

Logs should be time-bounded and rotated aggressively

9. Sealed Sender Delivery Tokens
Properties

Single-use

Short TTL

Optional sender scope:

specific user

specific handle

specific domain

Abuse protection

Rate limiting

Payload size caps

Optional proof-of-work

Token hash stored, not token itself

10. Federation Implementation
Discovery

.well-known/ikincikanal-server

Contains server public key and capabilities

Authentication

Every S2S request is signed (Ed25519)

Canonical request string includes:

method

path

body hash

timestamp

nonce

Replay protection

Nonce replay window: 5 minutes (aligned with timestamp skew policy)

Cache key: (X-Server-Origin, X-Nonce)

On cache hit: reject with 409 Conflict

Cache eviction: TTL-based (no persistence required)

Idempotency enforcement via envelopeId for message deduplication

Data minimization

No federation server stores messages longer than delivery window

User deletion events propagate to peers

11. Emergency Actions
/me/nuke

Two modes:

Delayed: short grace period, cancelable

Instant: requires device-level key signature

Effects

Deletes all server-side data

Revokes all devices

Notifies federated peers

12. Push Notifications
Privacy tradeoff

FCM/APNS reveal that a notification occurred

Content is never included

Recommended default

Push disabled for high-risk users

Long-polling enabled instead

13. Compromise Scenarios
Server compromise

Messages remain confidential

Metadata exposure minimized but possible

Federation keys may need rotation

Device compromise

Messages on that device are exposed

Future messages safe after device revocation

Past messages cannot be retroactively protected

Federation peer compromise

Limited to that peer's users

No global blast radius

Key rotation procedures

See: KEY_ROTATION.md for step-by-step procedures covering:

Server identity key rotation

Federation key rotation

Device key revocation policy

Emergency rotation under active compromise

14. Auditing & Transparency

Recommended practices:

Publish threat model

Publish cryptographic design notes

Allow independent audits

Open-source client cryptography code where possible

15. Final Guarantees (Plain Language)

IKINCI KANAL guarantees that:

The server cannot read your messages

Messages are encrypted end-to-end

Emergency deletion is possible

Federation does not imply global trust

IKINCI KANAL does not guarantee that:

A compromised device cannot leak messages

Screenshots can be prevented

Metadata can be fully eliminated

16. Implementation Order (Suggested)

Identity & device management

Signal session establishment

Message send / receive

Sealed sender

Emergency deletion

Federation (receive-only → full)

Calls & TURN integration

This document is part of the security contract.
If behavior is not documented here, it must not be relied upon.