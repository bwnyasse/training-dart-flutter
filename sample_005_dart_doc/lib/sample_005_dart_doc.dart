/// A student in the Dart & Flutter training
class Student {
  /// The name of the student as mentioned in his passport
  final String name;

  /// The surname of the student as mentioned in his passport
  final String surname;

  /// Default Constructor
  Student({this.name, this.surname});

  /// Factory to create [Student] from json data
  factory Student.fromJsonData(Map<String, String> data) => Student(
        name: data['name'],
        surname: data['surname'],
      );

  /// Override the [toString()] method to display information about this [Student]
  @override
  String toString() => "Student with name '$name' and surname '$surname'";
}
