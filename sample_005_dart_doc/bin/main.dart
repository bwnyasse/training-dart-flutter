import 'package:sample_005_dart_doc/sample_005_dart_doc.dart';

void main() {
  final json = <String, String>{
    'name': 'Nyasse',
    'surname': 'Boris-Wilfried',
  };
  final student = Student.fromJsonData(json);

  print(student.toString());
}
