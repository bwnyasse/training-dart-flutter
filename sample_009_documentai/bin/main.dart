import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sample_009_documentai/commands/commands.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
      'documentai', 'Document AI Sample CLI Tool for Dart Developers')
    ..addCommand(ListProcessorTypes())
    ..addCommand(CreateProcessor())
    ..addCommand(ProcessDocument());

  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a command line usage error
  });
}
