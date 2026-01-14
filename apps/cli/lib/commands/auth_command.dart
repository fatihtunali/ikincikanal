import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class AuthCommand extends Command<void> {
  @override
  final name = 'auth';

  @override
  final description = 'Authentication commands (login, logout, register, status)';

  AuthCommand() {
    addSubcommand(LoginSubcommand());
    addSubcommand(LogoutSubcommand());
    addSubcommand(RegisterSubcommand());
    addSubcommand(StatusSubcommand());
  }
}

class LoginSubcommand extends Command<void> {
  @override
  final name = 'login';

  @override
  final description = 'Login to IKINCI KANAL';

  LoginSubcommand() {
    argParser.addOption(
      'handle',
      abbr: 'u',
      help: 'Your username/handle',
      mandatory: true,
    );
    argParser.addOption(
      'server',
      abbr: 's',
      help: 'Server URL (default: api.itinerarytemplate.com)',
      defaultsTo: 'https://api.itinerarytemplate.com',
    );
  }

  @override
  Future<void> run() async {
    final handle = argResults!['handle'] as String;
    final server = argResults!['server'] as String;

    Output.info('Logging in as $handle to $server...');

    // Prompt for password securely
    stdout.write('Password: ');
    stdin.echoMode = false;
    final password = stdin.readLineSync() ?? '';
    stdin.echoMode = true;
    stdout.writeln();

    if (password.isEmpty) {
      Output.error('Password cannot be empty');
      exit(1);
    }

    try {
      // TODO: Implement actual login via ikinci_core
      // final authService = AuthService(server);
      // final result = await authService.login(handle, password);

      // For now, store mock credentials
      await CredentialsStore.saveCredentials(
        server: server,
        handle: handle,
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
      );

      Output.success('Successfully logged in as $handle');
    } catch (e) {
      Output.error('Login failed: $e');
      exit(1);
    }
  }
}

class LogoutSubcommand extends Command<void> {
  @override
  final name = 'logout';

  @override
  final description = 'Logout from IKINCI KANAL';

  @override
  Future<void> run() async {
    try {
      await CredentialsStore.clearCredentials();
      Output.success('Successfully logged out');
    } catch (e) {
      Output.error('Logout failed: $e');
      exit(1);
    }
  }
}

class RegisterSubcommand extends Command<void> {
  @override
  final name = 'register';

  @override
  final description = 'Register a new account';

  RegisterSubcommand() {
    argParser.addOption(
      'handle',
      abbr: 'u',
      help: 'Desired username/handle',
      mandatory: true,
    );
    argParser.addOption(
      'server',
      abbr: 's',
      help: 'Server URL (default: api.itinerarytemplate.com)',
      defaultsTo: 'https://api.itinerarytemplate.com',
    );
  }

  @override
  Future<void> run() async {
    final handle = argResults!['handle'] as String;
    final server = argResults!['server'] as String;

    Output.info('Registering $handle on $server...');

    // Prompt for password securely
    stdout.write('Password: ');
    stdin.echoMode = false;
    final password = stdin.readLineSync() ?? '';
    stdin.echoMode = true;
    stdout.writeln();

    stdout.write('Confirm Password: ');
    stdin.echoMode = false;
    final confirmPassword = stdin.readLineSync() ?? '';
    stdin.echoMode = true;
    stdout.writeln();

    if (password != confirmPassword) {
      Output.error('Passwords do not match');
      exit(1);
    }

    if (password.length < 8) {
      Output.error('Password must be at least 8 characters');
      exit(1);
    }

    try {
      // TODO: Implement actual registration via ikinci_core
      Output.success('Successfully registered $handle');
      Output.info('Please login with: ikinci auth login -u $handle');
    } catch (e) {
      Output.error('Registration failed: $e');
      exit(1);
    }
  }
}

class StatusSubcommand extends Command<void> {
  @override
  final name = 'status';

  @override
  final description = 'Show current authentication status';

  @override
  Future<void> run() async {
    final creds = await CredentialsStore.getCredentials();

    if (creds == null) {
      Output.warning('Not logged in');
      Output.info('Use: ikinci auth login -u <handle>');
    } else {
      Output.info('Logged in as: ${creds['handle']}');
      Output.info('Server: ${creds['server']}');
    }
  }
}
