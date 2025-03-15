import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_explorer/shared/models/location_model.dart';

enum MapStatus { initial, loading, loaded, error }

class MapState extends Equatable {
  final MapStatus status;
  final List<LocationModel> locations;
  final Set<Marker> markers;
  final CameraPosition? cameraPosition;
  final String? errorMessage;
  final LocationModel? selectedLocation;

  const MapState({
    this.status = MapStatus.initial,
    this.locations = const [],
    this.markers = const {},
    this.cameraPosition,
    this.errorMessage,
    this.selectedLocation,
  });

  MapState copyWith({
    MapStatus? status,
    List<LocationModel>? locations,
    Set<Marker>? markers,
    CameraPosition? cameraPosition,
    String? errorMessage,
    LocationModel? selectedLocation,
    bool clearSelectedLocation = false,
  }) {
    return MapState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      markers: markers ?? this.markers,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedLocation: clearSelectedLocation
          ? null
          : (selectedLocation ?? this.selectedLocation),
    );
  }

  @override
  List<Object?> get props => [
        status,
        locations,
        markers,
        cameraPosition,
        errorMessage,
        selectedLocation
      ];
}
