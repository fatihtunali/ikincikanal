import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:ikinci_cli/commands/auth_command.dart';
import 'package:ikinci_cli/commands/chat_command.dart';
import 'package:ikinci_cli/commands/contacts_command.dart';
import 'package:ikinci_cli/commands/devices_command.dart';
import 'package:ikinci_cli/commands/groups_command.dart';
import 'package:ikinci_cli/commands/status_command.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner<void>(
    'ikinci',
    'IKINCI KANAL - Secure E2EE Messaging CLI',
  )
    ..addCommand(AuthCommand())
    ..addCommand(ChatCommand())
    ..addCommand(ContactsCommand())
    ..addCommand(DevicesCommand())
    ..addCommand(GroupsCommand())
    ..addCommand(StatusCommand());

  try {
    await runner.run(arguments);
  } on UsageException catch (e) {
    stderr.writeln(e);
    exit(64);
  } catch (e) {
    stderr.writeln('Error: $e');
    exit(1);
  }
}
