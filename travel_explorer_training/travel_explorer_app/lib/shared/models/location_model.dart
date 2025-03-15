class LocationModel {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String? imageUrl;
  
  LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.imageUrl,
  });
}