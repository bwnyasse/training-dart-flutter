import 'dart:io';
import 'package:path/path.dart' as p;

/// An extension on [String] that provides a method to clean the value by removing double quotes and trimming whitespace.
extension CleanBodyResponse on String {
  /// Cleans the string value by removing double quotes and trimming whitespace.
  ///
  /// Returns the cleaned string value.
  String cleanValue() => replaceAll('"', '').trim();
}

/// Checks if the code is running inside a Docker container.
///
/// Returns an empty string if the code is running inside a Docker container, or the string 'assets' if it's not running in a Docker container.
String isRunningInDockerContainer() =>
    Platform.environment["FETCHER_SERVICE_IN_DOCKER"] == 'true' ? '' : 'assets';

/// Retrieves the service account key from a file.
///
/// Returns the service account key as a [String].
String getSAKey() => File(p.join(
      Directory.current.path,
      isRunningInDockerContainer(),
      'sa-key.json',
    )).readAsStringSync();

String removeNewlines(String? s) {
  return s?.replaceAll("\n", "").replaceAll("\r", "") ?? "";
}
