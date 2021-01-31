import 'package:bloc/bloc.dart';

/// A `AppCubit` which manages an `int` as its state.
class AppCubit extends Cubit<int> {
  /// The initial state of the `AppCubit` is 0.
  AppCubit() : super(0);

  /// When nextEvenNumber is called, the current state
  /// of the cubit is accessed via `state` and
  /// a new `state` is emitted via `emit`.
  void nextEvenNumber() => emit((state % 2) == 0 ? state + 2 : state + 1);

  /// When nextOddNumber is called, the current state
  /// of the cubit is accessed via `state` and
  /// a new `state` is emitted via `emit`.
  void nextOddNumber() => emit((state % 2) == 0 ? state + 1 : state + 2);
}
