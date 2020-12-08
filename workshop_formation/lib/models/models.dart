class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

List<Book> availableBooks() => [
      Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
      Book('Foundation', 'Isaac Asimov'),
      Book('Fahrenheit 451', 'Ray Bradbury'),
    ];
