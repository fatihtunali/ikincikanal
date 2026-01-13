IKINCI KANAL – Yol Haritası (Production’a giden net rota)
Faz 0 — Proje Temeli (1–2 gün)

Amaç: Kod yazmadan önce zemini sabitlemek (sonradan acı çektirmesin).

Çıktılar

Repo yapısı (mono veya multi repo)

Ortamlar: dev / staging / prod

CI: lint + test + build + OpenAPI validation

Observability: structured logs + trace id

“No sensitive logs” kuralı (ciphertext, token, signature, key yok)

Kararlar

Backend: NestJS + Postgres + Redis

Migrations: Prisma / TypeORM (hangisi hızlıysan)

Rate limit: Redis-based

Faz 1 — Identity + Auth (Sprint 1)

Amaç: Hesap açma ve giriş “tam güvenli akışla” çalışsın.

1.1 Passkey (Primary) – WebAuthn

Implement

POST /auth/passkey/options

POST /auth/passkey/verify

WebAuthn doğrulama (challenge store: Redis TTL 5 dk)

Data

passkeys tablosu: credentialId, publicKey, counter, transports, userId

Güvenlik

Challenge single-use

Origin/RPID doğrulaması (ikincikanal.com)

Counter replay önleme

1.2 Password (Fallback)

Implement

POST /auth/register

RegisterRequest MUST use oneOf (exclusive):
- Passkey-based registration (passkey field)
- Password-based registration (password field)
- Supplying both is invalid (422 Validation Error)

POST /auth/login

Argon2id parametreleri spec ile uyumlu

Brute-force politikası: IP+handle rate limit (Redis)

1.3 Tokenlar

Implement

POST /auth/refresh

Access token kısa ömür (örn. 15 dk)

Refresh token device-bound, rotate-on-use

DoD (Definition of Done)

Passkey ile login ✅

Password fallback ✅

Rate limit ✅

Audit-friendly logs ✅

Faz 2 — Devices + Keys (Sprint 2)

Amaç: Signal key materyali sunucuya doğru yüklenip doğru servis edilsin.

2.1 Device Management

GET /devices

POST /devices

DELETE /devices/{deviceId}

POST /devices/revoke-all

POST /devices/revoke-all-including-current

Data

devices: identityKeyPub, registrationId, revokedAt, lastActiveAt

2.2 Keys

POST /keys/upload

GET /keys/count

GET /keys/prekey-bundle/{userId}?deviceId=...

Atomicity şartı

one-time prekey “verildiği anda” tüketilmeli (transaction)

DoD

Prekey bundle al → client session kurabilir ✅

one-time prekeys doğru azalıyor ✅

revoked device key verilmiyor ✅

Faz 3 — Messaging Core (Sprint 3)

Amaç: Store-and-forward E2EE mesajlaşma uçtan uca çalışsın.

3.1 Core queue

POST /messages/send

GET /messages/pending?waitSeconds=&limit=

POST /messages/ack

Data

message_queue:

serverMessageId

toDeviceId

fromUserId/fromDeviceId (sealed değilse)

ciphertext blob (opaque)

receivedAt, expiresAt

clientMessageId (dedupe)

3.2 Idempotency

Idempotency-Key + (senderDeviceId, clientMessageId) dedupe

Aynı mesaj retry’da kopya oluşturmaz

3.3 Long-poll

waitSeconds için:

Redis pubsub / blocking wait (basit)

timeout 30 sn

**Note:** WebSocket delivery is intentionally deferred to post-MVP (Faz 8) to reduce attack surface and operational complexity.

DoD

2 cihaz: mesaj gönder/al ✅

offline iken kuyrukta bekle ✅

ack sonrası server’da silin ✅

TTL sonrası otomatik silin ✅

Faz 4 — Sealed Sender (Sprint 4)

Amaç: Sunucunun “kim gönderdi” bilgisini bilmediği mod üretimde çalışsın.

4.1 Delivery Token

POST /messages/delivery-token

Token store: hash + scope + single-use + expiry

Max 10 aktif token / user

4.2 Sealed Send

POST /messages/send-sealed (auth’suz)

Token validasyon:

scope kontrolü (forSenderType/value)

payload bytes limit

token single-use

4.3 Anti-abuse

IP rate limit

Token brute-force: tokenHash lookup + constant-time reject

Opsiyonel PoW doğrulaması

DoD

Sealed message geldiğinde fromUserId=null ✅

Recipient decrypt ile sender’ı görür ✅

Token tek kullanım ✅

Spam denemesi rate limit’e takılır ✅

Faz 5 — Calls (Sprint 5)

Amaç: WebRTC arama gizlilik odaklı şekilde çalışsın.

5.1 TURN credentials

GET /calls/turn-credentials

HMAC secret ile ephemeral username/password

Rate limit 10/saat/user

5.2 Signaling

POST /calls/invite

POST /calls/signal

GET /calls/events/pending

POST /calls/events/ack

DoD

1:1 sesli arama ✅

relay policy default: relay ✅

call events TTL (5 dk) ✅

Faz 6 — Federation MVP (Sprint 6)

Amaç: Server-to-server mesaj teslimi (minimum viable federation).

6.1 Discovery

GET /.well-known/ikincikanal-server

6.2 Inbox (S2S)

POST /federation/inbox

Header signature doğrulama:

timestamp ±5 dk

nonce cache 5 dk (Redis)

signature verify (Ed25519)

6.3 Keys proxy

GET /federation/keys/{userId}

6.4 Deletion notice

POST /federation/user-deleted

DoD

Server A → Server B’ye mesaj bırakır ✅

Replay aynı nonce ile reddedilir ✅

Key rotation id’si ile çalışır ✅

Faz 7 — Privacy & Operations (Sprint 7)

Amaç: “Gerçek güvenlik ürünü”ne dönüş.

7.1 Nuke (2-step)

POST /me/nuke

standard: token + 30 sn confirm

instant: deviceKeySignature doğrulama

7.2 Export

GET /me/export (içerik plaintext değil; sadece metadata + pending count)

7.3 Push

PUT /push/token

DELETE /push/token

push payload içeriksiz

7.4 KEY_ROTATION.md + Incident playbook

Federation key rotate

TURN secret rotate

Auth token signing key rotate

Emergency procedures

Faz 8 — Polish (Post-MVP)

Amaç: MVP sonrası iyileştirmeler ve genişletmeler.

8.1 Real-time Delivery

WebSocket connection (long-poll yerine)

Connection multiplexing

Heartbeat / reconnection logic

8.2 Group Messaging

MLS (Messaging Layer Security) veya Signal Group Protocol

Group key management

Member add/remove with forward secrecy

8.3 Rich Features

Message reactions (encrypted)

Typing indicators (ephemeral, no persistence)

Read receipts (opt-in)

Link previews (client-side only, no server fetch)

8.4 Platform Expansion

Desktop app (Electron/Tauri)

CLI client (developer/power user)

DoD

WebSocket stabil ve güvenli ✅

Grup mesajlaşma E2EE ✅

Mobile + Desktop + Web tam uyum ✅

Kabul Kriterleri (Production Gate)

Güvenlik

Ciphertext asla loglanmıyor

Sealed sender’da sender metadata yok

Federation replay koruması aktif

Rate limit her public endpointte var

Operasyon

Metrics: request rate, error rate, queue depth

Alerts: federation failures, nonce replay spikes, brute-force spikes

Backups: sadece gerekli DB; token hash ve public key’ler dahil

Performans

/messages/pending long-poll 30 sn altında stabil

Queue TTL cleanup job düzgün çalışıyor

Proje Yapısı (İskelet değil: net modül planı)

NestJS modülleri:

AuthModule (password + passkey + refresh)

UsersModule

DevicesModule

KeysModule

MessagesModule

CallsModule

PushModule

FederationModule

PrivacyModule

AbuseModule (rate limit, PoW, token validation, nonce cache)

Cross-cutting:

AuditLogInterceptor (redaction)

RequestIdMiddleware

RateLimitGuard

DbTransactionHelper