class Person {
  final String name;
  final String surname;
  Person({
    required this.name,
    required this.surname,
  }) {
    // Nothing to do right ?
    // Remove theses comment lines to see the lint rule : 
    // https://dart-lang.github.io/linter/lints/empty_constructor_bodies.html
  }

  @override
  String toString() => '$surname $name';
}

void main() {
  final p = Person(name: 'Nyasse', surname: 'Boris-Wilfried');
  print('Hello $p');
}
