import 'dart:io';
import 'package:sample_dart_cli/api/api.dart';

Future execute(String zip, String country) async {
  final rainBow = Runes('\u{1F308}');

  if (zip.isEmpty || country.isEmpty) {
    stderr.writeln('error: arguments missing');
  } else {
    try {
      final apiResult = await getWeather(zip: zip, country: country);
      stdout.writeln('');
      stdout.writeln(
          'Weather in ${apiResult.name} ${String.fromCharCodes(rainBow)}');
      stdout.writeln('---------------------------------------');

      final date =
          DateTime.fromMillisecondsSinceEpoch(apiResult.dt.toInt() * 1000);
      final dateTimeString = '${date.day}.${date.month}.${date.year} :';
      final tempString =
          'Now: ${apiResult.main.temp} °C, Min: ${apiResult.main.tempMin} °C, Max: ${apiResult.main.tempMax} °C';
      stdout.writeln(dateTimeString);
      stdout.writeln(tempString);
      stdout.writeln('');
    } catch (e) {
      stderr.writeln('error: networking error');
      stderr.writeln(e.toString());
    }
  }
}
