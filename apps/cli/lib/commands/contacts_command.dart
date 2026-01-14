import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class ContactsCommand extends Command<void> {
  @override
  final name = 'contacts';

  @override
  final description = 'Contact management commands (add, list, remove)';

  ContactsCommand() {
    addSubcommand(AddContactSubcommand());
    addSubcommand(ListContactsSubcommand());
    addSubcommand(RemoveContactSubcommand());
  }
}

class AddContactSubcommand extends Command<void> {
  @override
  final name = 'add';

  @override
  final description = 'Add a new contact';

  AddContactSubcommand() {
    argParser.addOption(
      'handle',
      abbr: 'u',
      help: 'User handle to add (e.g., user@server.com)',
      mandatory: true,
    );
    argParser.addOption(
      'name',
      abbr: 'n',
      help: 'Display name for the contact',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final handle = argResults!['handle'] as String;
    final name = argResults!['name'] as String?;

    try {
      // TODO: Implement contact adding via ikinci_core
      // This will verify the user exists and store locally

      Output.success('Added contact: ${name ?? handle}');
    } catch (e) {
      Output.error('Failed to add contact: $e');
      exit(1);
    }
  }
}

class ListContactsSubcommand extends Command<void> {
  @override
  final name = 'list';

  @override
  final description = 'List all contacts';

  ListContactsSubcommand() {
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
      // TODO: Implement contact listing via local storage

      if (jsonOutput) {
        Output.raw('[]');
      } else {
        Output.info('Contacts:');
        Output.info('---');
        Output.info('No contacts yet');
        Output.info('');
        Output.info('Add a contact with: ikinci contacts add -u user@server.com');
      }
    } catch (e) {
      Output.error('Failed to list contacts: $e');
      exit(1);
    }
  }
}

class RemoveContactSubcommand extends Command<void> {
  @override
  final name = 'remove';

  @override
  final description = 'Remove a contact';

  RemoveContactSubcommand() {
    argParser.addOption(
      'handle',
      abbr: 'u',
      help: 'User handle to remove',
      mandatory: true,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final handle = argResults!['handle'] as String;

    try {
      // TODO: Implement contact removal

      Output.success('Removed contact: $handle');
    } catch (e) {
      Output.error('Failed to remove contact: $e');
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
