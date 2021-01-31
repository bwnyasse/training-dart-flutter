import 'package:flutter/material.dart';

class ExpandSample extends StatefulWidget {
  @override
  _ExpandSampleState createState() => _ExpandSampleState();
}

class _ExpandSampleState extends State<ExpandSample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //TODO-2: En s'inspirant du code ci-dessous, rajouter respectivement les widgets fournis
            ],
          ),
        ),
      ),
    );
  }
}
