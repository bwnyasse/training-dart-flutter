import 'package:my_conditional_lib/src/core/extract_words.dart' as extract;
import 'dart:html' show querySelector;

void run(final markup) {
  final output = extract.extractWords(markup);
  final result = 'Hello, your Dart Web App is running <br> $output';
  querySelector('#output').innerHtml = result;
}
