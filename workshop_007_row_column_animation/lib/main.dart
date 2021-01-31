import 'package:flutter/material.dart';
import 'package:workshop_007_row_column_animation/src/expand_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanding Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpandSample(),
    );
  }
}
