import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travel_explorer/shared/models/location_model.dart';

class MapRepository {
  Future<List<LocationModel>> getLocations() async {
    try {
      // Load json from assets
      final jsonString =
          await rootBundle.loadString('assets/data/locations.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // Convert JSON to Location models
      return jsonData.map((data) {
        // Convert string type to enum
        final Map<String, dynamic> jsonWithEnumType =
            Map<String, dynamic>.from(data);

        return LocationModel.fromJson(jsonWithEnumType);
      }).toList();
    } catch (e) {
      // Log more details about the error
      print('Error loading locations: $e');
      print('Error details: ${e.toString()}');
      throw Exception('Failed to load locations: $e');
    }
  }
}
