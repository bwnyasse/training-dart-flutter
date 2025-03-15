import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_explorer/shared/models/location_model.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLocations extends MapEvent {}

class MapCreated extends MapEvent {
  final GoogleMapController controller;
  
  MapCreated(this.controller);
  
  @override
  List<Object?> get props => [controller];
}

class SelectLocation extends MapEvent {
  final LocationModel location;
  
  SelectLocation(this.location);
  
  @override
  List<Object?> get props => [location];
}

class CameraPositionChanged extends MapEvent {
  final CameraPosition position;
  
  CameraPositionChanged(this.position);
  
  @override
  List<Object?> get props => [position];
}