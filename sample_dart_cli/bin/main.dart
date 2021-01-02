import 'dart:io';
import 'package:args/args.dart' show ArgParser;
import 'package:sample_dart_cli/weather.dart' as weather;

void main(List<String> arguments) {
  /*
  *  0 = Success
  *  1 = Warnings
  *  2 = Errors
  */
  exitCode = 0;

  final parser = ArgParser()
    ..addOption('zip', abbr: 'z')
    ..addOption('country', abbr: 'c', defaultsTo: 'fr');

  final argResults = parser.parse(arguments);
  final zip = argResults['zip'];
  final country = argResults['country'];
  if (country == 'fr') {
    assert(zip.length > 4, 'For france , the zip must have 5 digits');
  }
  weather.execute(zip, country);
}
