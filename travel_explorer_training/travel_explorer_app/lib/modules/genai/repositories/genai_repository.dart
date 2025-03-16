// lib/modules/genai/repositories/genai_repository.dart
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/foundation.dart';

class GenAIRepository {
  static const String _modelName = 'gemini-2.0-flash';
  GenerativeModel? _model;

  // Initialize the model
  Future<void> initialize() async {
    if (_model != null) return;

    try {
      debugPrint('Initializing Gemini model with $_modelName');
      _model = FirebaseVertexAI.instance.generativeModel(model: _modelName);
    } catch (e) {
      debugPrint('Error initializing Gemini model: $e');
      _model = null;
      rethrow;
    }
  }

  // Generate a description for a location
  Future<String> generateLocationDescription(
      String locationName, String locationType) async {
    if (_model == null) {
      await initialize();
    }

    if (_model == null) {
      return Future.error(Exception('Gemini model not initialized'));
    }

    try {
      final prompt = _createPrompt(locationName, locationType);

      final response = await _model!.generateContent([
        Content.text(prompt),
      ]);

      if (response.text == null) {
        throw Exception('Empty response from Gemini');
      }

      return _cleanMarkdownText(response.text!);
    } catch (e) {
      debugPrint('Error generating location description: $e');
      return Future.error(Exception('Failed to generate description: $e'));
    }
  }

  // Create a prompt for the location description
  String _createPrompt(String locationName, String locationType) {
    return '''
    Generate a short, engaging travel description (50-70 words) for a $locationType called "$locationName". 
    Include 1-2 interesting facts and why a traveler might want to visit.
    Be specific and descriptive without being too verbose.
    Do not use markdown formatting.
    ''';
  }

  String _cleanMarkdownText(String markdown) {
    // Implementation remains the same as current AIService
    var cleaned = markdown.replaceAll(RegExp(r'#{1,6}\s.*\n'), '');
    cleaned = cleaned.replaceAll(RegExp(r'\*\*|__|\*|_'), '');
    cleaned = cleaned.replaceAll(RegExp(r'```[\s\S]*?```'), '');
    cleaned = cleaned.replaceAll(RegExp(r'`[^`]*`'), '');
    cleaned = cleaned.replaceAll(RegExp(r'^\s*[-*+]\s+', multiLine: true), '');
    cleaned = cleaned.replaceAll(RegExp(r'^\s*\d+\.\s+', multiLine: true), '');
    cleaned = cleaned.replaceAll(RegExp(r'\[([^\]]*)\]\([^\)]*\)'), r'$1');
    cleaned = cleaned.replaceAll(RegExp(r'^\s*[-*_]{3,}\s*'), '');
    cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ');
    return cleaned.trim();
  }
}
