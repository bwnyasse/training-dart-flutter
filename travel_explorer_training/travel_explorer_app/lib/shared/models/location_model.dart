import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

enum LocationType {
  @JsonValue('restaurant')
  restaurant,
  
  @JsonValue('hotel')
  hotel,
  
  @JsonValue('attraction')
  attraction,
  
  @JsonValue('landmark')
  landmark,
  
  @JsonValue('other')
  other
}

@freezed
abstract class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    required LocationType type,
    String? description,
    String? imageUrl,
    double? rating,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}