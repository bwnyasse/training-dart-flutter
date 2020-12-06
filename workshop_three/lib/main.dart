import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Battery Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Platform The client and host sides of a channel are connected
  // through a channel name passed in the channel constructor
  //TODO: Récuperer le channel

  // Get battery level.
  String _batteryLevelMsg = 'Unknown battery level.';
  double _percent = 0;

  Future<void> _getBatteryLevel() async {
    //TODO: Méthode qui va récupérer le niveau de la batterie en faisant appel via la méthode 'invokeMethod'
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Workshop N°3 - Platform channel"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 10.0,
                percent: _percent,
                center: new Text(_batteryLevelMsg),
                progressColor: _percent > 0.5 ? Colors.green : Colors.red,
              ),
              ElevatedButton(
                child: Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
