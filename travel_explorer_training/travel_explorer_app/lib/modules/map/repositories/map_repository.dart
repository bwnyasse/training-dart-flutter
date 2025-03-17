import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_explorer/shared/models/location_model.dart';

class MapRepository {
  // Base URL for our API
  final String baseUrl = 'http://localhost:8080';

  Future<List<LocationModel>> getLocations() async {
    try {
      // Make API request instead of loading from assets
      final response = await http.get(Uri.parse('$baseUrl/locations'));
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Convert JSON to Location models directly
        return jsonData.map((data) => LocationModel.fromJson(
          Map<String, dynamic>.from(data)
        )).toList();
      } else {
        throw Exception('Failed to load locations: Status code ${response.statusCode}');
      }
    } catch (e) {
      // Log more details about the error
      print('Error loading locations: $e');
      print('Error details: ${e.toString()}');
      throw Exception('Failed to load locations: $e');
    }
  }
  
  Future<LocationModel> getLocationById(String id) async {
    try {
      // Make API request
      final response = await http.get(Uri.parse('$baseUrl/locations/$id'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        
        // No need for field mapping now
        return LocationModel.fromJson(data);
      } else {
        throw Exception('Failed to load location: Status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading location: $e');
      throw Exception('Failed to load location: $e');
    }
  }
}