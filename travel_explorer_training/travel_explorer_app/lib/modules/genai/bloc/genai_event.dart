// lib/modules/genai/bloc/genai_event.dart
import 'package:equatable/equatable.dart';

abstract class GenAIEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenerateLocationDescription extends GenAIEvent {
  final String locationName;
  final String locationType;

  GenerateLocationDescription({
    required this.locationName,
    required this.locationType,
  });

  @override
  List<Object?> get props => [locationName, locationType];
}

class ClearDescription extends GenAIEvent {}