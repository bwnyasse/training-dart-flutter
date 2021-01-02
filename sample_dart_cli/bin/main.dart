import 'dart:io';
import 'package:args/args.dart' show ArgParser, ArgResults;
import 'package:sample_dart_cli/weather.dart' as weather;

ArgParser _configureArgParser() => ArgParser()
  ..addOption(
    'zip',
    help: '[required] The zip code',
    abbr: 'z',
  )
  ..addOption(
    'country',
    help: 'The country code',
    abbr: 'c',
    defaultsTo: 'fr',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    help: 'Show the usage',
  );

int _checkArgResults(List<String> args, ArgParser parser, ArgResults results) {
  if (results['help'] == true || args.isEmpty) {
    print(parser.usage);
    return -1;
  }

  // Check zip as required
  if (results['zip'] == null) {
    print(parser.usage);
    return -1;
  }

  return 0;
}

void main(List<String> args) {
  final parser = _configureArgParser();

  final argResults = parser.parse(args);
  final code = _checkArgResults(args, parser, argResults);
  if (code != 0) {
    exit(code);
  }

  final zip = argResults['zip'];
  final country = argResults['country'];
  if (country == 'fr') {
    assert(zip.length > 4, 'For france, the zip must have 5 digits');
  }
  weather.execute(zip, country);
}
