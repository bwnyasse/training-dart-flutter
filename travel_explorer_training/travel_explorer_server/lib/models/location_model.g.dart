// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      lat: (json['latitude'] as num).toDouble(),
      lng: (json['longitude'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'latitude': instance.lat,
      'longitude': instance.lng,
      'rating': instance.rating,
    };
