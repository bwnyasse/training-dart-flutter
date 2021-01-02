import 'impl/logic_none.dart'
    if (dart.library.io) 'impl/logic_io.dart' // dart:io implementation
    if (dart.library.html) 'impl/logic_html.dart' // dart:html implementation
    as implementation;

void exec(final markup) {
  implementation.run(markup);
}
