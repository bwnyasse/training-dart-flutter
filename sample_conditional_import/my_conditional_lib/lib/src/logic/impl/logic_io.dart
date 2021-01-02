import 'package:my_conditional_lib/src/core/extract_words.dart' as extract;

void run(final markup) {
  final output = extract.extractWords(markup);
  print('Hello, your Dart Cli App is running : \n $output');
}
