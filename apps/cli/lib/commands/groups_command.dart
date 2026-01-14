import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class GroupsCommand extends Command<void> {
  @override
  final name = 'groups';

  @override
  final description = 'Group messaging commands (create, list, members, send)';

  GroupsCommand() {
    addSubcommand(CreateGroupSubcommand());
    addSubcommand(ListGroupsSubcommand());
    addSubcommand(GroupMembersSubcommand());
    addSubcommand(AddMemberSubcommand());
    addSubcommand(RemoveMemberSubcommand());
    addSubcommand(LeaveGroupSubcommand());
    addSubcommand(SendGroupMessageSubcommand());
  }
}

class CreateGroupSubcommand extends Command<void> {
  @override
  final name = 'create';

  @override
  final description = 'Create a new group';

  CreateGroupSubcommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      help: 'Group name',
      mandatory: true,
    );
    argParser.addMultiOption(
      'members',
      abbr: 'm',
      help: 'Initial members (comma-separated handles)',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final name = argResults!['name'] as String;
    final members = argResults!['members'] as List<String>;

    try {
      // TODO: Implement group creation via ikinci_core
      // This will use MLS to create an encrypted group

      Output.success('Group "$name" created');
      if (members.isNotEmpty) {
        Output.info('Added members: ${members.join(", ")}');
      }
      Output.info('Group ID: <generated-id>');
    } catch (e) {
      Output.error('Failed to create group: $e');
      exit(1);
    }
  }
}

class ListGroupsSubcommand extends Command<void> {
  @override
  final name = 'list';

  @override
  final description = 'List all groups you are a member of';

  ListGroupsSubcommand() {
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
      // TODO: Implement group listing via ikinci_core

      if (jsonOutput) {
        Output.raw('[]');
      } else {
        Output.info('Your groups:');
        Output.info('---');
        Output.info('  ID        | Name           | Members | Role');
        Output.info('  ----------|----------------|---------|------');
        Output.info('  (no groups yet)');
        Output.info('');
        Output.info('Create a group with: ikinci groups create -n "Group Name"');
      }
    } catch (e) {
      Output.error('Failed to list groups: $e');
      exit(1);
    }
  }
}

class GroupMembersSubcommand extends Command<void> {
  @override
  final name = 'members';

  @override
  final description = 'List members of a group';

  GroupMembersSubcommand() {
    argParser.addOption(
      'group',
      abbr: 'g',
      help: 'Group ID',
      mandatory: true,
    );
    argParser.addFlag(
      'json',
      help: 'Output in JSON format',
      defaultsTo: false,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final groupId = argResults!['group'] as String;
    final jsonOutput = argResults!['json'] as bool;

    try {
      // TODO: Implement member listing via ikinci_core

      if (jsonOutput) {
        Output.raw('[]');
      } else {
        Output.info('Members of group $groupId:');
        Output.info('---');
        Output.info('  Handle              | Role   | Joined');
        Output.info('  --------------------|--------|-------');
      }
    } catch (e) {
      Output.error('Failed to list members: $e');
      exit(1);
    }
  }
}

class AddMemberSubcommand extends Command<void> {
  @override
  final name = 'add-member';

  @override
  final description = 'Add a member to a group';

  AddMemberSubcommand() {
    argParser.addOption(
      'group',
      abbr: 'g',
      help: 'Group ID',
      mandatory: true,
    );
    argParser.addOption(
      'user',
      abbr: 'u',
      help: 'User handle to add',
      mandatory: true,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final groupId = argResults!['group'] as String;
    final user = argResults!['user'] as String;

    try {
      // TODO: Implement member addition via ikinci_core
      // This will use MLS Welcome messages

      Output.success('Added $user to group $groupId');
    } catch (e) {
      Output.error('Failed to add member: $e');
      exit(1);
    }
  }
}

class RemoveMemberSubcommand extends Command<void> {
  @override
  final name = 'remove-member';

  @override
  final description = 'Remove a member from a group (requires admin)';

  RemoveMemberSubcommand() {
    argParser.addOption(
      'group',
      abbr: 'g',
      help: 'Group ID',
      mandatory: true,
    );
    argParser.addOption(
      'user',
      abbr: 'u',
      help: 'User handle to remove',
      mandatory: true,
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final groupId = argResults!['group'] as String;
    final user = argResults!['user'] as String;

    try {
      // TODO: Implement member removal via ikinci_core

      Output.success('Removed $user from group $groupId');
    } catch (e) {
      Output.error('Failed to remove member: $e');
      exit(1);
    }
  }
}

class LeaveGroupSubcommand extends Command<void> {
  @override
  final name = 'leave';

  @override
  final description = 'Leave a group';

  LeaveGroupSubcommand() {
    argParser.addOption(
      'group',
      abbr: 'g',
      help: 'Group ID',
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

    final groupId = argResults!['group'] as String;
    final force = argResults!['force'] as bool;

    if (!force) {
      stdout.write('Are you sure you want to leave group $groupId? [y/N] ');
      final confirm = stdin.readLineSync()?.toLowerCase();
      if (confirm != 'y' && confirm != 'yes') {
        Output.info('Cancelled');
        return;
      }
    }

    try {
      // TODO: Implement group leaving via ikinci_core

      Output.success('Left group $groupId');
    } catch (e) {
      Output.error('Failed to leave group: $e');
      exit(1);
    }
  }
}

class SendGroupMessageSubcommand extends Command<void> {
  @override
  final name = 'send';

  @override
  final description = 'Send a message to a group';

  SendGroupMessageSubcommand() {
    argParser.addOption(
      'group',
      abbr: 'g',
      help: 'Group ID',
      mandatory: true,
    );
    argParser.addOption(
      'message',
      abbr: 'm',
      help: 'Message content',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final groupId = argResults!['group'] as String;
    var message = argResults!['message'] as String?;

    // If no message provided, read from stdin
    if (message == null || message.isEmpty) {
      Output.info('Enter message (Ctrl+D to send):');
      message = stdin.readLineSync() ?? '';
    }

    if (message.isEmpty) {
      Output.error('Message cannot be empty');
      exit(1);
    }

    try {
      // TODO: Implement group message sending via ikinci_core
      // This will use MLS to encrypt for all group members

      Output.success('Message sent to group $groupId');
    } catch (e) {
      Output.error('Failed to send message: $e');
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
