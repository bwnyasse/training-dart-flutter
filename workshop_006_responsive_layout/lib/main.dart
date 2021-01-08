import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/home_page.dart';

void main() {
  runApp(MyResponsiveApp());
}

class MyResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Responsive Design',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}