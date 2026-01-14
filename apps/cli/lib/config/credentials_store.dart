import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

/// Credentials storage for CLI authentication
///
/// Stores credentials in ~/.ikinci/credentials.json
///
/// TODO: For production, consider using system keyring:
/// - Windows: Credential Manager
/// - macOS: Keychain
/// - Linux: Secret Service API
class CredentialsStore {
  static String get _configDir {
    final home = Platform.environment['HOME'] ??
        Platform.environment['USERPROFILE'] ??
        '.';
    return path.join(home, '.ikinci');
  }

  static String get _credentialsPath => path.join(_configDir, 'credentials.json');

  /// Save credentials to storage
  static Future<void> saveCredentials({
    required String server,
    required String handle,
    required String accessToken,
    required String refreshToken,
  }) async {
    final dir = Directory(_configDir);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final file = File(_credentialsPath);
    final data = {
      'server': server,
      'handle': handle,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'savedAt': DateTime.now().toIso8601String(),
    };

    await file.writeAsString(jsonEncode(data));

    // Set file permissions to owner-only on Unix systems
    if (!Platform.isWindows) {
      await Process.run('chmod', ['600', _credentialsPath]);
    }
  }

  /// Get stored credentials
  static Future<Map<String, dynamic>?> getCredentials() async {
    final file = File(_credentialsPath);
    if (!await file.exists()) {
      return null;
    }

    try {
      final content = await file.readAsString();
      return jsonDecode(content) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  /// Clear stored credentials
  static Future<void> clearCredentials() async {
    final file = File(_credentialsPath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Get just the access token
  static Future<String?> getAccessToken() async {
    final creds = await getCredentials();
    return creds?['accessToken'] as String?;
  }

  /// Get just the refresh token
  static Future<String?> getRefreshToken() async {
    final creds = await getCredentials();
    return creds?['refreshToken'] as String?;
  }

  /// Get the server URL
  static Future<String?> getServer() async {
    final creds = await getCredentials();
    return creds?['server'] as String?;
  }

  /// Update just the tokens (after refresh)
  static Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final creds = await getCredentials();
    if (creds == null) {
      throw StateError('No credentials stored');
    }

    await saveCredentials(
      server: creds['server'] as String,
      handle: creds['handle'] as String,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
