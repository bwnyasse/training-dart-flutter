import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanding Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // TODO-1: Rajouter le widget ExampleSample() dans le home
      // home: ...
    );
  }
}