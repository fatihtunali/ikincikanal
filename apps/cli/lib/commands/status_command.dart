import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class StatusCommand extends Command<void> {
  @override
  final name = 'status';

  @override
  final description = 'Show current status and connection info';

  StatusCommand() {
    argParser.addFlag(
      'json',
      help: 'Output in JSON format',
      defaultsTo: false,
    );
  }

  @override
  Future<void> run() async {
    final jsonOutput = argResults!['json'] as bool;
    final creds = await CredentialsStore.getCredentials();

    if (jsonOutput) {
      if (creds == null) {
        Output.raw('{"authenticated": false}');
      } else {
        Output.raw('{"authenticated": true, "handle": "${creds['handle']}", "server": "${creds['server']}"}');
      }
      return;
    }

    Output.info('IKINCI KANAL CLI Status');
    Output.info('=======================');
    Output.info('');

    if (creds == null) {
      Output.warning('Authentication: Not logged in');
      Output.info('');
      Output.info('To get started:');
      Output.info('  1. Register: ikinci auth register -u your_handle');
      Output.info('  2. Login:    ikinci auth login -u your_handle');
    } else {
      Output.success('Authentication: Logged in');
      Output.info('  Handle: ${creds['handle']}');
      Output.info('  Server: ${creds['server']}');
      Output.info('');

      // TODO: Fetch and display connection status
      Output.info('Connection: Not connected');
      Output.info('  Use "ikinci chat watch" to start receiving messages');
    }

    Output.info('');
    Output.info('Commands:');
    Output.info('  ikinci auth     - Authentication (login, logout, register)');
    Output.info('  ikinci chat     - Messaging (send, list, read, watch)');
    Output.info('  ikinci contacts - Contact management');
    Output.info('  ikinci devices  - Device management');
    Output.info('  ikinci groups   - Group messaging');
    Output.info('');
    Output.info('For help: ikinci --help');
  }
}
