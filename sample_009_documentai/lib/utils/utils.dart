import 'dart:io';
import 'package:googleapis/documentai/v1.dart';
import 'package:path/path.dart' as p;
import 'package:googleapis_auth/auth_io.dart' as auth;

/// An extension on [String] that provides a method to clean the value by removing double quotes and trimming whitespace.
extension CleanBodyResponse on String {
  /// Cleans the string value by removing double quotes and trimming whitespace.
  ///
  /// Returns the cleaned string value.
  String cleanValue() => replaceAll('"', '').trim();

  String removeNewlines() => replaceAll("\n", "").replaceAll("\r", "");
}

//FIXME: having that in args..
String getParentLocation() {
  // Configuration parameters
  final projectId = 'learning-box-369917';
  final location = 'us';
  return 'projects/$projectId/locations/$location';
}

class AuthUtils {
  static Future<auth.AuthClient> getAuthenticatedClient() async {
    final accountCredentials =
        auth.ServiceAccountCredentials.fromJson(getSAKey());
    return await auth.clientViaServiceAccount(
        accountCredentials, [DocumentApi.cloudPlatformScope]);
  }

  /// Retrieves the service account key from a file.
  ///
  /// Returns the service account key as a [String].
  static String getSAKey() => File(p.join(
        Directory.current.path,
        isRunningInDockerContainer(),
        'sa-key.json',
      )).readAsStringSync();

  /// Checks if the code is running inside a Docker container.
  ///
  /// Returns an empty string if the code is running inside a Docker container, or the string 'assets' if it's not running in a Docker container.
  static String isRunningInDockerContainer() =>
      Platform.environment["FETCHER_SERVICE_IN_DOCKER"] == 'true'
          ? ''
          : 'assets';
}
