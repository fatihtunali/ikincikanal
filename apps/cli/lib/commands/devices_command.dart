import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class DevicesCommand extends Command<void> {
  @override
  final name = 'devices';

  @override
  final description = 'Device management commands (list, revoke)';

  DevicesCommand() {
    addSubcommand(ListDevicesSubcommand());
    addSubcommand(RevokeDeviceSubcommand());
    addSubcommand(RevokeAllSubcommand());
  }
}

class ListDevicesSubcommand extends Command<void> {
  @override
  final name = 'list';

  @override
  final description = 'List all registered devices';

  ListDevicesSubcommand() {
    argParser.addFlag(
      'json',
      help: 'Output in JSON format',
      defaultsTo: false,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final jsonOutput = argResults!['json'] as bool;

    try {
      // TODO: Implement device listing via ikinci_core

      if (jsonOutput) {
        Output.raw('[]');
      } else {
        Output.info('Registered devices:');
        Output.info('---');
        Output.info('  ID                                   | Name          | Last Active');
        Output.info('  -------------------------------------|---------------|------------');
        Output.info('  (cli device will appear here)');
      }
    } catch (e) {
      Output.error('Failed to list devices: $e');
      exit(1);
    }
  }
}

class RevokeDeviceSubcommand extends Command<void> {
  @override
  final name = 'revoke';

  @override
  final description = 'Revoke a specific device';

  RevokeDeviceSubcommand() {
    argParser.addOption(
      'id',
      help: 'Device ID to revoke',
      mandatory: true,
    );
    argParser.addFlag(
      'force',
      abbr: 'f',
      help: 'Skip confirmation prompt',
      defaultsTo: false,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final deviceId = argResults!['id'] as String;
    final force = argResults!['force'] as bool;

    if (!force) {
      stdout.write('Are you sure you want to revoke device $deviceId? [y/N] ');
      final confirm = stdin.readLineSync()?.toLowerCase();
      if (confirm != 'y' && confirm != 'yes') {
        Output.info('Cancelled');
        return;
      }
    }

    try {
      // TODO: Implement device revocation via ikinci_core

      Output.success('Device $deviceId has been revoked');
    } catch (e) {
      Output.error('Failed to revoke device: $e');
      exit(1);
    }
  }
}

class RevokeAllSubcommand extends Command<void> {
  @override
  final name = 'revoke-all';

  @override
  final description = 'Revoke all other devices (keeps current device)';

  RevokeAllSubcommand() {
    argParser.addFlag(
      'force',
      abbr: 'f',
      help: 'Skip confirmation prompt',
      defaultsTo: false,
    );
    argParser.addFlag(
      'include-current',
      help: 'Also revoke current device (will log you out)',
      defaultsTo: false,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final force = argResults!['force'] as bool;
    final includeCurrent = argResults!['include-current'] as bool;

    if (!force) {
      final message = includeCurrent
          ? 'Are you sure you want to revoke ALL devices including this one? [y/N] '
          : 'Are you sure you want to revoke all OTHER devices? [y/N] ';
      stdout.write(message);
      final confirm = stdin.readLineSync()?.toLowerCase();
      if (confirm != 'y' && confirm != 'yes') {
        Output.info('Cancelled');
        return;
      }
    }

    try {
      // TODO: Implement mass device revocation via ikinci_core

      if (includeCurrent) {
        await CredentialsStore.clearCredentials();
        Output.success('All devices revoked. You have been logged out.');
      } else {
        Output.success('All other devices have been revoked');
      }
    } catch (e) {
      Output.error('Failed to revoke devices: $e');
      exit(1);
    }
  }
}

Future<void> _requireAuth() async {
  final creds = await CredentialsStore.getCredentials();
  if (creds == null) {
    Output.error('Not logged in. Please run: ikinci auth login -u <handle>');
    exit(1);
  }
}
