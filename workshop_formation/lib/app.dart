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
        //TODO-1: Fournit la liste des pages au Navigator en renseignant l'attribut pages

        //TODO-2 : Comment faire le pop des pages ? 
      ),
    );
  }
}
