import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.imageUrl,
    required this.lat,
    required this.lng,
    required this.rating,
  });

  final String id;
  final String name;
  final String type;
  final String description;
  final String imageUrl;
  @JsonKey(name: 'latitude')
  final double lat;
  @JsonKey(name: 'longitude')
  final double lng;
  final double rating;

  /// Factory constructor for creating a new LocationModel instance from JSON.
  factory LocationModel.fromJson(Map<String, dynamic> json) => 
      _$LocationModelFromJson(json);

  /// Converts this LocationModel instance to JSON.
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}