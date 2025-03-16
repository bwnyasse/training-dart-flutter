// lib/modules/genai/bloc/genai_state.dart
import 'package:equatable/equatable.dart';

enum GenAIStatus { initial, loading, success, error }

class GenAIState extends Equatable {
  final GenAIStatus status;
  final String? description;
  final String? errorMessage;

  const GenAIState({
    this.status = GenAIStatus.initial,
    this.description,
    this.errorMessage,
  });

  GenAIState copyWith({
    GenAIStatus? status,
    String? description,
    String? errorMessage,
  }) {
    return GenAIState(
      status: status ?? this.status,
      description: description ?? this.description,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, description, errorMessage];
}