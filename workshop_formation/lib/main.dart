/*
 * Dart & Flutter - Training
 * 
 * Copyright (c) Boris-Wilfried Nyasse
 * All rights reserved
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Imperative',
    //RESOLUTION: configurer la navigation
    initialRoute: '/',
    routes: {
      '/': (context) => Screen1(),
      '/second': (context) => Screen2(),
    },
  ));
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('via le push : Naviguer vers l\'écran N°2'),
          //RESOLUTION: Implémenter la navigation vers un autre écran nommé
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('via le pop : retour à l\'écran précédent'),
          //RESOLUTION: Implémenter la navigation retour
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
