import 'bloc/tuto_bloc.dart';
import 'bloc/tuto_event.dart';

void main(List<String> args) async {
  var numberOfInteraction = args.isEmpty ? 1 : int.parse(args.first);
  print('----------BLOC with $numberOfInteraction interactions ----------');

  /// Create a `AppBloc` instance.
  final bloc = AppBloc();

  /// Access the state of the `bloc` via `state`.
  print('Initial value: ${bloc.state}');

  bloc.listen((data) {
    /// Access the new `state`.
    print('Value: $data');
  });

  /// Interact with the `bloc` to trigger `state` changes.

  var count = numberOfInteraction;
  while (count >= 1) {
    //print('Send -> nextEvenNumber');
    bloc.add(AppEvent.nextEvenNumber);
    count--;
  }


  count = numberOfInteraction;
  while (count >= 1) {
    //print('Send -> nextOddNumber');
    bloc.add(AppEvent.nextOddNumber);
    count--;
  }

  /// Close the `bloc` when it is no longer needed.
  await bloc.close();
}
