import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';

class Screen1 extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  Screen1({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°1'),
      ),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}
