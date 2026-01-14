import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

class IdentityKeyPair {
  final String publicKey; // Base64 encoded
  final String privateKey; // Base64 encoded
  final int registrationId;

  IdentityKeyPair({
    required this.publicKey,
    required this.privateKey,
    required this.registrationId,
  });
}

class IdentityKeyService {
  static final _algorithm = X25519();

  /// Generate a new identity key pair for device registration
  static Future<IdentityKeyPair> generateIdentityKeyPair() async {
    // Generate X25519 key pair
    final keyPair = await _algorithm.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

    // Generate registration ID (random 14-bit integer)
    final random = Random.secure();
    final registrationId = random.nextInt(16380) + 1; // 1 to 16380

    return IdentityKeyPair(
      publicKey: base64Encode(publicKey.bytes),
      privateKey: base64Encode(Uint8List.fromList(privateKeyBytes)),
      registrationId: registrationId,
    );
  }

  /// Generate a signed prekey
  static Future<Map<String, dynamic>> generateSignedPrekey({
    required String identityPrivateKey,
    required int keyId,
  }) async {
    // Generate new key pair for signed prekey
    final keyPair = await _algorithm.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyBytes = await keyPair.extractPrivateKeyBytes();

    // Sign the public key with identity key (simplified - in production use Ed25519)
    final signature = await _signWithIdentityKey(
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

  /// Generate one-time prekeys
  static Future<List<Map<String, dynamic>>> generateOneTimePrekeys({
    required int startKeyId,
    required int count,
  }) async {
    final prekeys = <Map<String, dynamic>>[];

    for (int i = 0; i < count; i++) {
      final keyPair = await _algorithm.newKeyPair();
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

  /// Simple signature using HMAC (in production, use Ed25519)
  static Future<String> _signWithIdentityKey(
    String identityPrivateKey,
    List<int> data,
  ) async {
    final hmac = Hmac.sha256();
    final secretKey = SecretKey(base64Decode(identityPrivateKey));
    final mac = await hmac.calculateMac(data, secretKey: secretKey);
    return base64Encode(mac.bytes);
  }
}
