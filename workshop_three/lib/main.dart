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
  // Platform
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String _batteryLevelMsg = 'Unknown battery level.';
  double _percent = 0;

  Future<void> _getBatteryLevel() async {
    String msg;
    double value;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      value = result.toDouble() / 100;
      msg = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      msg = "Failed to get battery level: '${e.message}'.";
      value = 0;
    }

    setState(() {
      _batteryLevelMsg = msg;
      _percent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
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
    );
  }
}
