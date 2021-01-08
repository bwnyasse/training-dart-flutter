import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/utils/my_colors.dart'
    as my_colors;

class MediaQueryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: my_colors.darkGreen,
        child: Center(
          child: Text(
            '''View with MediaQuery
          [width]: ${screenSize.width.toStringAsFixed(2)}
          [orientation]: $orientation''',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
