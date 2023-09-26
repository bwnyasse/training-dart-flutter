import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:sample_009_documentai/utils/utils.dart' as utils;

class ProcessDocument extends Command {
  @override
  final name = 'processDocument';
  @override
  final description = 'Process a document using a specified processor';

  ProcessDocument() {
    argParser
      ..addOption('processorId', abbr: 'p', help: 'ID of the processor')
      ..addOption('fileName', abbr: 'f', help: 'File name for processing', defaultsTo: 'form.pdf');
  }

  @override
  void run() {
    final processorId = argResults!['processorId'];
    final fileName = argResults!['fileName'];
    if (processorId == null) {
      print('Please provide a processor ID.');
      exit(1);
    }
    // Place your existing processDocument logic here, but adjust for the passed arguments
  }
}