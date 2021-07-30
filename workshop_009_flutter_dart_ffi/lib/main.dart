import 'package:flutter/material.dart';

// TODO- Import bridge dart

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
  // TODO- create the bridge reference

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
                // TODO- show the answer - What is the NBA ?
                _show('TODO- show the answer - What is the NBA ?');
              },
              child: const Text('What is the NBA ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                // TODO- show the answer - Max players ?
                _show('TODO- show the answer - Max players ?');
              },
              child: const Text('Max players ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                // TODO- show the answer - Best player ?
                _show('TODO- show the answer - Best player ?');
              },
              child: const Text('Best player ? '),
            ),
            ElevatedButton(
              onPressed: () async {
                // TODO- show the answer - NBA FAQ
                _show('TODO- show the answer - NBA FAQ');
              },
              child: const Text('NBA FAQ'),
            ),
          ],
        ),
      ),
    );
  }
}
