import 'package:flutter/material.dart';
import 'package:mobx_advance/src/pages/weather_search_page.dart';
import 'package:mobx_advance/src/providers/stores_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoresProvider(
      child: MaterialApp(
        title: 'Material App',
        home: WeatherSearchPage(),
      ),
    );
  }
}
