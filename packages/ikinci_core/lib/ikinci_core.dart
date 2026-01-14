/// IKINCI KANAL Core Library
///
/// Shared core functionality for IKINCI KANAL - Secure Decentralized Messaging.
/// This library provides:
/// - API services and interceptors
/// - Cryptographic operations (Signal Protocol)
/// - Data models
/// - Secure storage abstractions
library ikinci_core;

// =============================================================================
// API
// =============================================================================
export 'src/api/api_client.dart';
export 'src/api/api_providers.dart';
export 'src/api/websocket_service.dart';

// API Services
export 'src/api/services/auth_service.dart';
export 'src/api/services/calls_service.dart';
export 'src/api/services/device_service.dart';
export 'src/api/services/health_service.dart';
export 'src/api/services/keys_service.dart';
export 'src/api/services/messages_service.dart';
export 'src/api/services/push_service.dart';
export 'src/api/services/user_service.dart';

// API Interceptors
export 'src/api/interceptors/auth_interceptor.dart';

// =============================================================================
// Cryptography
// =============================================================================
export 'src/crypto/identity_keys.dart';

// =============================================================================
// Storage
// =============================================================================
export 'src/storage/secure_storage_interface.dart';
export 'src/storage/secure_storage.dart';

// =============================================================================
// Models - Auth
// =============================================================================
export 'src/models/auth/auth_response.dart';
export 'src/models/auth/passkey_attestation.dart';
export 'src/models/auth/passkey_options.dart';
export 'src/models/auth/register_request.dart';

// =============================================================================
// Models - Calls
// =============================================================================
export 'src/models/calls/call_event.dart';
export 'src/models/calls/call_request.dart';
export 'src/models/calls/turn_credentials.dart';

// =============================================================================
// Models - Common
// =============================================================================
export 'src/models/common/error.dart';

// =============================================================================
// Models - Device
// =============================================================================
export 'src/models/device/device.dart';

// =============================================================================
// Models - Health
// =============================================================================
export 'src/models/health/health_response.dart';

// =============================================================================
// Models - Keys
// =============================================================================
export 'src/models/keys/prekey.dart';
export 'src/models/keys/prekey_bundle.dart';

// =============================================================================
// Models - Messages
// =============================================================================
export 'src/models/messages/delivery_token.dart';
export 'src/models/messages/message_request.dart';
export 'src/models/messages/pending_message.dart';

// =============================================================================
// Models - Nuke
// =============================================================================
export 'src/models/nuke/nuke_response.dart';

// =============================================================================
// Models - Push
// =============================================================================
export 'src/models/push/push_token.dart';

// =============================================================================
// Models - User
// =============================================================================
export 'src/models/user/user.dart';
export 'src/models/user/data_export.dart';
