import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';
import 'package:workshop_formation/screens/screen_1.dart';
import 'package:workshop_formation/screens/screen_2.dart';
import 'package:workshop_formation/screens/screen_404.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  Book _selectedBook;
  bool show404 = false;
  List<Book> books = availableBooks();

  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook));
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
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
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (configuration.isDetailsPage) {
      if (configuration.id < 0 || configuration.id > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[configuration.id];
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }
}