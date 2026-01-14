import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';
import '../../../core/crypto/identity_keys.dart';
import '../../../core/storage/secure_storage.dart';

/// Keys management state
class KeysState {
  final int oneTimeKeyCount;
  final int recommendedMinimum;
  final bool isUploading;
  final String? error;

  const KeysState({
    this.oneTimeKeyCount = 0,
    this.recommendedMinimum = 20,
    this.isUploading = false,
    this.error,
  });

  bool get needsMoreKeys => oneTimeKeyCount < recommendedMinimum;

  KeysState copyWith({
    int? oneTimeKeyCount,
    int? recommendedMinimum,
    bool? isUploading,
    String? error,
  }) {
    return KeysState(
      oneTimeKeyCount: oneTimeKeyCount ?? this.oneTimeKeyCount,
      recommendedMinimum: recommendedMinimum ?? this.recommendedMinimum,
      isUploading: isUploading ?? this.isUploading,
      error: error,
    );
  }
}

class KeysNotifier extends StateNotifier<KeysState> {
  final KeysService _keysService;
  final SecureStorageService _storage;

  KeysNotifier(this._keysService, this._storage) : super(const KeysState());

  /// Check key count on server
  Future<void> checkKeyCount() async {
    try {
      final response = await _keysService.getKeyCount();
      state = state.copyWith(
        oneTimeKeyCount: response.oneTimeKeyCount,
        recommendedMinimum: response.recommendedMinimum,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Upload more prekeys if needed
  Future<bool> uploadPrekeysIfNeeded({int count = 100}) async {
    if (!state.needsMoreKeys) return true;

    return uploadPrekeys(count: count);
  }

  /// Upload prekeys
  Future<bool> uploadPrekeys({int count = 100}) async {
    state = state.copyWith(isUploading: true, error: null);

    try {
      final identityPrivateKey = await _storage.getIdentityPrivateKey();
      if (identityPrivateKey == null) {
        state = state.copyWith(
          isUploading: false,
          error: 'No identity key found',
        );
        return false;
      }

      // Generate signed prekey
      final signedPrekey = await IdentityKeyService.generateSignedPrekey(
        identityPrivateKey: identityPrivateKey,
        keyId: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      );

      // Generate one-time prekeys
      final oneTimePrekeys = await IdentityKeyService.generateOneTimePrekeys(
        count: count,
        startKeyId: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      );

      // Upload
      final response = await _keysService.uploadKeys(
        UploadKeysRequest(
          signedPreKey: SignedPreKey(
            keyId: signedPrekey['keyId'],
            publicKey: signedPrekey['publicKey'],
            signature: signedPrekey['signature'],
          ),
          oneTimePreKeys: oneTimePrekeys
              .map((k) => OneTimePreKey(
                    keyId: k['keyId'],
                    publicKey: k['publicKey'],
                  ))
              .toList(),
        ),
      );

      state = state.copyWith(
        oneTimeKeyCount: response.remainingOneTimeKeys,
        isUploading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isUploading: false, error: e.toString());
      return false;
    }
  }

  /// Get prekey bundle for a user
  Future<PreKeyBundle?> getPrekeyBundle(String userId, {String? deviceId}) async {
    try {
      return await _keysService.getPrekeyBundle(userId, deviceId: deviceId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final keysProvider = StateNotifierProvider<KeysNotifier, KeysState>((ref) {
  return KeysNotifier(
    ref.watch(keysServiceProvider),
    ref.watch(secureStorageProvider),
  );
});
