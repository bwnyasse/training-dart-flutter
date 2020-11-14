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
    home: Screen1(),
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
          //RESOLUTION: Implémenter la navigation vers un autre écran
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screen2(),
              ),
            );
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