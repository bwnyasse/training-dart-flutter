//import 'dart:html';
import 'html_wrapper.dart' if (dart.library.io) 'package:html/dom.dart';

List<String>? extractWords(final markup) =>
    DocumentFragment.html(markup).text?.split(' ');
