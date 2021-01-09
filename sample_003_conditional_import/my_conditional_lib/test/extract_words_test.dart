import 'package:my_conditional_lib/src/core/extract_words.dart';
import 'package:test/test.dart';

void main() {
  test('extractWords', () {
    final markup = r'<p>Some markup<span> comes here</span></p>';
    expect(
      extractWords(markup),
      orderedEquals(
        ['Some', 'markup', 'comes', 'here'],
      ),
    );
  });
}
