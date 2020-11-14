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
          //TODO: Implémenter la navigation vers un autre écran
          onPressed: () {
            print("TODO: Implémenter la navigation vers un autre écran");
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
           //TODO: Implémenter la navigation retour 
          onPressed: () {
            print("TODO: Implémenter la navigation retour ");
          },
        ),
      ),
    );
  }
}