import 'dart:io';

/// ANSI color codes for terminal output
class _Colors {
  static const reset = '\x1B[0m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const cyan = '\x1B[36m';
  static const gray = '\x1B[90m';
}

/// Output utility for formatted CLI output
class Output {
  /// Print an informational message (cyan)
  static void info(String message) {
    stdout.writeln('${_Colors.cyan}$message${_Colors.reset}');
  }

  /// Print a success message (green)
  static void success(String message) {
    stdout.writeln('${_Colors.green}✓ $message${_Colors.reset}');
  }

  /// Print a warning message (yellow)
  static void warning(String message) {
    stdout.writeln('${_Colors.yellow}⚠ $message${_Colors.reset}');
  }

  /// Print an error message (red)
  static void error(String message) {
    stderr.writeln('${_Colors.red}✗ $message${_Colors.reset}');
  }

  /// Print raw output (no colors, for JSON)
  static void raw(String message) {
    stdout.writeln(message);
  }

  /// Print a debug message (gray, only in debug mode)
  static void debug(String message) {
    if (Platform.environment['DEBUG'] == '1') {
      stdout.writeln('${_Colors.gray}[debug] $message${_Colors.reset}');
    }
  }

  /// Print a table row
  static void tableRow(List<String> columns, List<int> widths) {
    final buffer = StringBuffer();
    for (var i = 0; i < columns.length; i++) {
      final col = columns[i];
      final width = i < widths.length ? widths[i] : col.length;
      buffer.write(col.padRight(width));
      if (i < columns.length - 1) {
        buffer.write(' | ');
      }
    }
    stdout.writeln(buffer.toString());
  }

  /// Print a table separator
  static void tableSeparator(List<int> widths) {
    final buffer = StringBuffer();
    for (var i = 0; i < widths.length; i++) {
      buffer.write('-' * widths[i]);
      if (i < widths.length - 1) {
        buffer.write('-+-');
      }
    }
    stdout.writeln(buffer.toString());
  }

  /// Print a message with a specific format
  static void message({
    required String from,
    required String content,
    required DateTime timestamp,
  }) {
    final timeStr = '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    stdout.writeln('${_Colors.blue}[$timeStr]${_Colors.reset} ${_Colors.cyan}$from${_Colors.reset}: $content');
  }
}
