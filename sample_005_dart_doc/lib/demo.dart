
import 'package:meta/meta.dart';

optionalNamedParameters({@required String surname, @required  String name}) =>
    print(" My name is $surname $name ");

main() {
  // Not specified Named params
  optionalNamedParameters();

  // specified Named params
  optionalNamedParameters(surname: "Dupont", name: "Jean");
  optionalNamedParameters(name: "Jean", surname: "Dupont");

}
