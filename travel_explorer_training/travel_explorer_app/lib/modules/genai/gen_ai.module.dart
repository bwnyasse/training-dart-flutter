// lib/modules/genai/genai_module.dart
import 'package:flutter_modular/flutter_modular.dart';
import 'repositories/genai_repository.dart';

class GenAIModule extends Module {
  @override
  void exportedBinds(i) {
    // Register GenAIRepository as a singleton
    i.addSingleton<GenAIRepository>(GenAIRepository.new);
  }
}
