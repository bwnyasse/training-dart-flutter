import 'package:flutter/material.dart';

import 'ffi_bridge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo - Dart ffi'),
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
  final FFIBridge _ffiBridge = FFIBridge();

  void _show(message) {
    showDialog(
      builder: (_) => AlertDialog(
        content: Text(message.toString()),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('images/Logo-NBA.png')),
            ElevatedButton(
              onPressed: () async {
                _show(_ffiBridge.getDefinition());
              },
              child: const Text('What is the NBA ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                _show(_ffiBridge.getMaxOfPlayers());
              },
              child: const Text('Max players ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                _show(_ffiBridge.getBestPlayer());
              },
              child: const Text('Best player ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                _show(_ffiBridge.getNbaFAQ(false));
              },
              child: const Text('NBA FAQ'),
            ),
          ],
        ),
      ),
    );
  }
}
