import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';
import 'package:workshop_formation/screens/screen_1.dart';
import 'package:workshop_formation/screens/screen_2.dart';
import 'package:workshop_formation/screens/screen_404.dart';

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book _selectedBook;
  bool show404 = false;
  final List<Book> books = availableBooks();

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App - Navigation 2.0',
      home: Navigator(
        //RESOLUTION: Fournit la liste des pages au Navigator en renseignant l'attribut pages
        pages: [
          MaterialPage(
            key: ValueKey('Screen1'),
            child: Screen1(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (show404)
            MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
          else if (_selectedBook != null)
            MaterialPage(
                key: ValueKey('Screen2$_selectedBook'),
                child: Screen2(book: _selectedBook))
        ],

        //RESOLUTION : Comment faire le pop des pages ?
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }
}
