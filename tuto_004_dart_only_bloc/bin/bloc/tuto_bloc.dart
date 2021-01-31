import 'package:bloc/bloc.dart';

import 'tuto_event.dart';

/// A Bloc which handles converting `AppEvent`s into `int`s.
class AppBloc extends Bloc<AppEvent, int> {
  /// The initial state of the `AppBloc` is 0.
  AppBloc() : super(0);

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    switch (event) {

      /// When a `AppEvent.nextEvenNumber` event is added,
      /// the current `state` of the bloc is accessed via the `state` property
      /// and a new state is emitted via `yield`.
      case AppEvent.nextEvenNumber:
        yield (state % 2) == 0 ? state + 2 : state + 1;
        break;
      case AppEvent.nextOddNumber:
        yield (state % 2) == 0 ? state + 1 : state + 2;
        break;
    }
  }
}
