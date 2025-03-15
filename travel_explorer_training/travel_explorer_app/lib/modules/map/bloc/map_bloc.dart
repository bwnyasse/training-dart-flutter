import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_explorer/modules/map/bloc/map_event.dart';
import 'package:travel_explorer/modules/map/bloc/map_state.dart';
import 'package:travel_explorer/modules/map/repositories/map_repository.dart';
import 'package:travel_explorer/shared/models/location_model.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;
  GoogleMapController? _mapController;

  MapBloc({required MapRepository mapRepository})
      : _mapRepository = mapRepository,
        super(const MapState(
            cameraPosition: CameraPosition(
          target: LatLng(48.8566, 2.3522), // Paris
          zoom: 12,
        ))) {
    on<LoadLocations>(_onLoadLocations);
    on<MapCreated>(_onMapCreated);
    on<SelectLocation>(_onSelectLocation);
    on<CameraPositionChanged>(_onCameraPositionChanged);
    on<ClearSelection>(_onClearSelection);
  }

  Future<void> _onLoadLocations(
      LoadLocations event, Emitter<MapState> emit) async {
    emit(state.copyWith(status: MapStatus.loading));
    try {
      final locations = await _mapRepository.getLocations();
      final markers = _createMarkers(locations);

      emit(state.copyWith(
        status: MapStatus.loaded,
        locations: locations,
        markers: markers,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: MapStatus.error,
        errorMessage: 'Failed to load locations: ${error.toString()}',
      ));
    }
  }

  void _onMapCreated(MapCreated event, Emitter<MapState> emit) {
    _mapController = event.controller;
  }

  void _onSelectLocation(SelectLocation event, Emitter<MapState> emit) {
    final newCameraPosition = CameraPosition(
      target: LatLng(event.location.latitude, event.location.longitude),
      zoom: 15,
    );

    _mapController
        ?.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));

    emit(state.copyWith(
      cameraPosition: newCameraPosition,
      selectedLocation: event.location,
    ));
  }

  void _onCameraPositionChanged(
      CameraPositionChanged event, Emitter<MapState> emit) {
    emit(state.copyWith(cameraPosition: event.position));
  }

  void _onClearSelection(ClearSelection event, Emitter<MapState> emit) {
    emit(state.copyWith(clearSelectedLocation: true));
  }

  Set<Marker> _createMarkers(List<LocationModel> locations) {
    return locations.map((location) {
      return Marker(
        markerId: MarkerId(location.id),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: location.name,
          snippet: location.description,
        ),
        onTap: () => add(SelectLocation(location)),
      );
    }).toSet();
  }
}
