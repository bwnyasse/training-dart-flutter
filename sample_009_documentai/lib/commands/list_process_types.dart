import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:sample_009_documentai/utils/utils.dart' as utils;

class ListProcessorTypes extends Command {
  @override
  final name = 'listProcessorTypes';
  @override
  final description = 'List available processor types';

  @override
  void run() {
    // Place your existing listProcessorTypes logic here
  }
}