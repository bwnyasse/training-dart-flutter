import 'package:flutter/material.dart';
import 'package:workshop_007_row_column_animation/src/expand_section.dart';

class ExpandSample extends StatefulWidget {
  @override
  _ExpandSampleState createState() => _ExpandSampleState();
}

class _ExpandSampleState extends State<ExpandSample> {
  ///If the box is expanded
  bool _isExpanded = false;

  ///Toogle the box to expand or collapse
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Formation Dart & Flutter - Row | Column | Animation'),
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: _toogleExpand,
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    width: double.infinity,
                    child: Text(
                        'Click me to ' + (_isExpanded ? 'collapse' : 'expand')),
                  ),
                ),
              ),
              ExpandedSection(
                expand: _isExpanded,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.red[900],
                      padding: EdgeInsets.all(25.0),
                      child: Text('Hello RED'),
                    ),
                    Container(
                      color: Colors.yellow[900],
                      padding: EdgeInsets.all(25.0),
                      child: Text('Hello YELLOW'),
                    ),
                    Container(
                      color: Colors.green[900],
                      padding: EdgeInsets.all(25.0),
                      child: Text('Hello GREEN'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
