// lib/modules/genai/bloc/genai_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/genai_repository.dart';
import 'genai_event.dart';
import 'genai_state.dart';

class GenAIBloc extends Bloc<GenAIEvent, GenAIState> {
  final GenAIRepository _repository;

  GenAIBloc({required GenAIRepository repository})
      : _repository = repository,
        super(const GenAIState()) {
    on<GenerateLocationDescription>(_onGenerateLocationDescription);
    on<ClearDescription>(_onClearDescription);
  }

  Future<void> _onGenerateLocationDescription(
    GenerateLocationDescription event,
    Emitter<GenAIState> emit,
  ) async {
    emit(state.copyWith(status: GenAIStatus.loading));
    
    try {
      final description = await _repository.generateLocationDescription(
        event.locationName,
        event.locationType,
      );
      
      emit(state.copyWith(
        status: GenAIStatus.success,
        description: description,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GenAIStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onClearDescription(
    ClearDescription event,
    Emitter<GenAIState> emit,
  ) {
    emit(const GenAIState());
  }
}