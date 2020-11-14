/*
 * Dart & Flutter - Training
 * 
 * Copyright (c) Boris-Wilfried Nyasse
 * All rights reserved
*/

import 'package:flutter/material.dart';
import 'package:workshop_formation/src/screens/screens.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Imperative',
    //RESOLUTION: configurer la navigation
    initialRoute: '/',
    routes: {
      '/': (context) => Screen1(),
      '/second': (context) => Screen2(),
    },
    onGenerateRoute: (settings) {
      //RESOLUTION: Faire une navigation intelligente
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (context) => Screen1());
      } else if (settings.name == '/second') {
        return MaterialPageRoute(
          builder: (context) {
            return Screen2();
          },
        );
      }
      return MaterialPageRoute(builder: (context) => UnknownScreen());
    },
  ));
}





