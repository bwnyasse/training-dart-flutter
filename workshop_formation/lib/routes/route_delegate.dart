import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  Widget build(BuildContext context) {
    // TODO-3
    throw UnimplementedError();
  }

  @override
  // TODO-4
  GlobalKey<NavigatorState> get navigatorKey => throw UnimplementedError();

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) {
    // TODO-5
    throw UnimplementedError();
  }
} 