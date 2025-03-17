import 'dart:convert';
import 'dart:io';

import 'package:travel_explorer_server/models/location_model.dart';

/// Repository class that handles location data operations and caching
class LocationRepository {
  // Cache to avoid loading from disk repeatedly
  List<LocationModel>? _locations;

  /// Fetches all locations from the JSON file
  Future<List<LocationModel>> getLocations() async {
    // Return cached data if available
    if (_locations != null) {
      return _locations!;
    }

    try {
      // Read the file
      final file = File('data/locations.json');
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString) as List<dynamic>;

      // Convert JSON to Location models using the generated fromJson method
      _locations = jsonData
          .map((data) => LocationModel.fromJson(data as Map<String, dynamic>))
          .toList();

      return _locations!;
    } catch (e) {
      print('Error loading locations: $e');
      throw Exception('Failed to load locations: $e');
    }
  }

  /// Fetches a specific location by ID
  Future<LocationModel?> getLocationById(String id) async {
    final locations = await getLocations();
    try {
      return locations.firstWhere((location) => location.id == id);
    } catch (e) {
      // Return null if no matching location is found
      return null;
    }
  }
}
