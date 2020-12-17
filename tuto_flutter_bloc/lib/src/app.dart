import 'package:flutter/material.dart';
import 'package:tuto_flutter_bloc/src/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Bloc',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(title: 'Tutorial Formation - BLOC'),
    );
  }
}