//import 'dart:html';
import 'dart:html' if (dart.library.io) 'package:html/dom.dart';

List<String>? extractWords(final markup) =>
    DocumentFragment.html(markup).text?.split(' ');
