import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';
import 'package:workshop_formation/routes/route_delegate.dart';
import 'package:workshop_formation/routes/route_parser.dart';
import 'package:workshop_formation/screens/screen_1.dart';
import 'package:workshop_formation/screens/screen_2.dart';
import 'package:workshop_formation/screens/screen_404.dart';

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  @override
  Widget build(BuildContext context) {
    BookRouterDelegate _routerDelegate = BookRouterDelegate();
    BookRouteInformationParser _routeInformationParser =
        BookRouteInformationParser();
    return MaterialApp.router(
      title: 'Books App - Navigation 2.0',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}