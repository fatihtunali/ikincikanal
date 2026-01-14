import 'dart:async';
import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/config/credentials_store.dart';
import 'package:ikinci_cli/utils/output.dart';

class ChatCommand extends Command<void> {
  @override
  final name = 'chat';

  @override
  final description = 'Messaging commands (send, list, read, watch)';

  ChatCommand() {
    addSubcommand(SendSubcommand());
    addSubcommand(ListSubcommand());
    addSubcommand(ReadSubcommand());
    addSubcommand(WatchSubcommand());
  }
}

class SendSubcommand extends Command<void> {
  @override
  final name = 'send';

  @override
  final description = 'Send a message to a user';

  SendSubcommand() {
    argParser.addOption(
      'to',
      abbr: 't',
      help: 'Recipient handle (e.g., user@server.com)',
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

    final to = argResults!['to'] as String;
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
      // TODO: Implement actual message sending via ikinci_core
      // This will involve:
      // 1. Getting recipient's prekey bundle
      // 2. Establishing Signal session
      // 3. Encrypting message
      // 4. Sending to server

      Output.success('Message sent to $to');
    } catch (e) {
      Output.error('Failed to send message: $e');
      exit(1);
    }
  }
}

class ListSubcommand extends Command<void> {
  @override
  final name = 'list';

  @override
  final description = 'List recent conversations';

  ListSubcommand() {
    argParser.addOption(
      'limit',
      abbr: 'l',
      help: 'Number of conversations to show',
      defaultsTo: '10',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final limit = int.parse(argResults!['limit'] as String);

    try {
      // TODO: Implement conversation listing via ikinci_core
      Output.info('Recent conversations (last $limit):');
      Output.info('---');
      Output.info('No conversations yet');
    } catch (e) {
      Output.error('Failed to list conversations: $e');
      exit(1);
    }
  }
}

class ReadSubcommand extends Command<void> {
  @override
  final name = 'read';

  @override
  final description = 'Read messages from a conversation';

  ReadSubcommand() {
    argParser.addOption(
      'from',
      abbr: 'f',
      help: 'User handle to read messages from',
      mandatory: true,
    );
    argParser.addOption(
      'limit',
      abbr: 'l',
      help: 'Number of messages to show',
      defaultsTo: '20',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final from = argResults!['from'] as String;
    final limit = int.parse(argResults!['limit'] as String);

    try {
      // TODO: Implement message reading via ikinci_core
      Output.info('Messages from $from (last $limit):');
      Output.info('---');
      Output.info('No messages');
    } catch (e) {
      Output.error('Failed to read messages: $e');
      exit(1);
    }
  }
}

class WatchSubcommand extends Command<void> {
  @override
  final name = 'watch';

  @override
  final description = 'Watch for incoming messages in real-time';

  WatchSubcommand() {
    argParser.addFlag(
      'all',
      abbr: 'a',
      help: 'Watch all conversations',
      defaultsTo: true,
    );
    argParser.addOption(
      'from',
      abbr: 'f',
      help: 'Watch specific user only',
    );
  }

  @override
  Future<void> run() async {
    await _requireAuth();

    final watchAll = argResults!['all'] as bool;
    final from = argResults!['from'] as String?;

    if (from != null) {
      Output.info('Watching messages from $from... (Ctrl+C to stop)');
    } else if (watchAll) {
      Output.info('Watching all incoming messages... (Ctrl+C to stop)');
    }

    // Set up signal handler for graceful exit
    ProcessSignal.sigint.watch().listen((_) {
      Output.info('\nStopping message watch...');
      exit(0);
    });

    try {
      // TODO: Implement WebSocket connection via ikinci_core
      // This will use the WebSocketService to receive real-time messages

      // Keep the process alive
      await Future.delayed(const Duration(days: 365));
    } catch (e) {
      Output.error('Watch failed: $e');
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
