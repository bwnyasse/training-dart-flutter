import 'dart:html';

void main() {
  querySelector('#output').text = 'Hello, Dart!';
  alignImageProperly();
  addHeader();
  addStyleElement();
  alignFooter();
  fixCase();
  fixSpelling();
}

void alignImageProperly() {
  querySelector('#tears')
    ..parent.style.setProperty('width', '100%')
    ..style.setProperty('display', 'block')
    ..style.setProperty('margin-right', 'auto')
    ..style.setProperty('margin-left', 'auto');
}

void addHeader() {
  var heading = HeadingElement.h3();
  heading.text = 'Animal Names';
  querySelector('.dogs').children.insert(0, heading);
}

void addStyleElement() {
  var styleElement = StyleElement();
  document.head.append(styleElement);
  CssStyleSheet sheet = styleElement.sheet;

  final rule = '.dogs { width: 150px; padding: 20px; margin-left: auto; margin-right: auto; display: block; }';
  sheet.insertRule(rule, 0);
}

void fixCase() {
  var listElementChildren = querySelector('.dogs').children[1].children;

  listElementChildren.asMap().forEach((idx, value) {
    listElementChildren[idx].text = '${value.text[0].toUpperCase()}${value.text.substring(1)}';
  });
}

void alignFooter() {
  querySelectorAll('footer').first.style.setProperty('text-align', 'center');
}

void fixSpelling() {
  var p = querySelector('footer').querySelector('p');
  final innerHtml = p.innerHtml.replaceFirst('offical', 'official');
  p.setInnerHtml(
    innerHtml,
    treeSanitizer: AllowAllTreeSanitizer(),
  );
}

class AllowAllTreeSanitizer implements NodeTreeSanitizer {
  @override
  void sanitizeTree(Node node) {}
}
