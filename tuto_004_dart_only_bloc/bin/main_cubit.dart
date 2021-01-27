import 'cubit/tuto_cubit.dart';

void main(List<String> args) {
  var numberOfInteraction = args.isEmpty ? 1 : int.parse(args.first);
  print('----------CUBIT with $numberOfInteraction interactions ----------');

  /// Create a `AppCubit` instance.
  final cubit = AppCubit();

  /// Access the state of the `cubit` via `state`.
  print('Initial value: ${cubit.state}');

  cubit.listen((data) {
    /// Access the new `state`.
    print('Value: $data');
  });

  /// Interact with the `cubit` to trigger `state` changes.

  var count = numberOfInteraction;
  while (count >= 1) {
    //print('Call -> nextEvenNumber');
    cubit.nextEvenNumber();
    count--;
  }

  count = numberOfInteraction;
  while (count >= 1) {
    //print('Call -> nextOddNumber');
    cubit.nextOddNumber();
    count--;
  }

  /// Close the `cubit` when it is no longer needed.
  cubit.close();
}
