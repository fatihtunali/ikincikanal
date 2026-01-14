import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

/// Identity key pair for Signal Protocol
/// - Ed25519 for signing (identity verification, prekey signatures)
/// - X25519 for key exchange (session establishment)
class IdentityKeyPair {
  final String publicKey; // Ed25519 public key, Base64 encoded
  final String privateKey; // Ed25519 private key, Base64 encoded
  final int registrationId;

  IdentityKeyPair({
    required this.publicKey,
    required this.privateKey,
    required this.registrationId,
  });
}

/// X25519 key pair for Diffie-Hellman key exchange
class DhKeyPair {
  final String publicKey; // X25519 public key, Base64 encoded
  final String privateKey; // X25519 private key, Base64 encoded
  final int keyId;

  DhKeyPair({
    required this.publicKey,
    required this.privateKey,
    required this.keyId,
  });
}

class IdentityKeyService {
  static final _ed25519 = Ed25519();
  static final _x25519 = X25519();

  /// Generate a new Ed25519 identity key pair for device registration
  /// This key is used for:
  /// - Signing prekeys
  /// - Device verification
  /// - Nuke signature (instant mode)
  static Future<IdentityKeyPair> generateIdentityKeyPair() async {
    // Generate Ed25519 key pair for signing
    final keyPair = await _ed25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

    // Generate registration ID (random 14-bit integer, 1-16380)
    final random = Random.secure();
    final registrationId = random.nextInt(16380) + 1;

    return IdentityKeyPair(
      publicKey: base64Encode(publicKey.bytes),
      privateKey: base64Encode(Uint8List.fromList(privateKeyBytes)),
      registrationId: registrationId,
    );
  }

  /// Generate a signed prekey (X25519 DH key signed with Ed25519 identity key)
  /// Used in Signal Protocol X3DH handshake
  static Future<Map<String, dynamic>> generateSignedPrekey({
    required String identityPrivateKey,
    required int keyId,
  }) async {
    // Generate X25519 key pair for DH exchange
    final keyPair = await _x25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

    // Sign the public key with Ed25519 identity key
    final signature = await signWithEd25519(
      identityPrivateKey,
      publicKey.bytes,
    );

    return {
      'keyId': keyId,
      'publicKey': base64Encode(publicKey.bytes),
      'privateKey': base64Encode(Uint8List.fromList(privateKeyBytes)),
      'signature': signature,
    };
  }

  /// Generate one-time prekeys (X25519 DH keys, no signature needed)
  /// These are ephemeral keys consumed during session establishment
  static Future<List<Map<String, dynamic>>> generateOneTimePrekeys({
    required int startKeyId,
    required int count,
  }) async {
    final prekeys = <Map<String, dynamic>>[];

    for (int i = 0; i < count; i++) {
      final keyPair = await _x25519.newKeyPair();
      final publicKey = await keyPair.extractPublicKey();
      final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

      prekeys.add({
        'keyId': startKeyId + i,
        'publicKey': base64Encode(publicKey.bytes),
        'privateKey': base64Encode(Uint8List.fromList(privateKeyBytes)),
      });
    }

    return prekeys;
  }

  /// Sign data with Ed25519 identity key
  /// Returns Base64-encoded signature
  static Future<String> signWithEd25519(
    String privateKeyBase64,
    List<int> data,
  ) async {
    final privateKeyBytes = base64Decode(privateKeyBase64);

    // Reconstruct Ed25519 key pair from private key
    final keyPair = await _ed25519.newKeyPairFromSeed(privateKeyBytes);

    // Sign the data
    final signature = await _ed25519.sign(data, keyPair: keyPair);

    return base64Encode(signature.bytes);
  }

  /// Verify Ed25519 signature
  /// Returns true if signature is valid
  static Future<bool> verifyEd25519Signature({
    required String publicKeyBase64,
    required List<int> data,
    required String signatureBase64,
  }) async {
    try {
      final publicKeyBytes = base64Decode(publicKeyBase64);
      final signatureBytes = base64Decode(signatureBase64);

      final publicKey = SimplePublicKey(
        publicKeyBytes,
        type: KeyPairType.ed25519,
      );

      final signature = Signature(
        signatureBytes,
        publicKey: publicKey,
      );

      return await _ed25519.verify(data, signature: signature);
    } catch (e) {
      return false;
    }
  }

  /// Create nuke signature for instant account deletion
  /// Message format: "NUKE:{userId}:{timestamp}"
  static Future<String> createNukeSignature({
    required String identityPrivateKey,
    required String userId,
    required String timestamp,
  }) async {
    final message = 'NUKE:$userId:$timestamp';
    final messageBytes = utf8.encode(message);
    return signWithEd25519(identityPrivateKey, messageBytes);
  }

  /// Generate X25519 ephemeral key pair for session
  static Future<DhKeyPair> generateEphemeralKeyPair(int keyId) async {
    final keyPair = await _x25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

    return DhKeyPair(
      publicKey: base64Encode(publicKey.bytes),
      privateKey: base64Encode(Uint8List.fromList(privateKeyBytes)),
      keyId: keyId,
    );
  }

  /// Perform X25519 Diffie-Hellman key exchange
  /// Returns shared secret
  static Future<Uint8List> performDh({
    required String privateKeyBase64,
    required String remotePublicKeyBase64,
  }) async {
    final privateKeyBytes = base64Decode(privateKeyBase64);
    final remotePublicKeyBytes = base64Decode(remotePublicKeyBase64);

    final keyPair = await _x25519.newKeyPairFromSeed(privateKeyBytes);
    final remotePublicKey = SimplePublicKey(
      remotePublicKeyBytes,
      type: KeyPairType.x25519,
    );

    final sharedSecret = await _x25519.sharedSecretKey(
      keyPair: keyPair,
      remotePublicKey: remotePublicKey,
    );

    final secretBytes = await sharedSecret.extractBytes();
    return Uint8List.fromList(secretBytes);
  }
}
