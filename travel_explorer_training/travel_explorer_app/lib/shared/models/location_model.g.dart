// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    _LocationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      type: $enumDecode(_$LocationTypeEnumMap, json['type']),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': _$LocationTypeEnumMap[instance.type]!,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'rating': instance.rating,
    };

const _$LocationTypeEnumMap = {
  LocationType.restaurant: 'restaurant',
  LocationType.hotel: 'hotel',
  LocationType.attraction: 'attraction',
  LocationType.landmark: 'landmark',
  LocationType.other: 'other',
};
