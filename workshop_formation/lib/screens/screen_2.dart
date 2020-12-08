import 'package:flutter/material.dart';
import 'package:workshop_formation/models/models.dart';

class Screen2 extends StatelessWidget {
  final Book book;

  Screen2({
    @required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (book != null) ...[
              Image.network(book.imageLink),
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ],
            ElevatedButton(
              //RESOLUTION: Implémenter la navigation retour
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('via le pop : retour à l\'écran précédent'),
            ),
          ],
        ),
      ),
    );
  }
}
