import 'package:flutter/material.dart';
import 'package:workshop_formation/src/i18n/i18n.dart';

import 'package:workshop_formation/src/models/models.dart';
import 'package:workshop_formation/src/widgets/widgets.dart';

// ------------------
// UnknowScreen
// ------------------
class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

// ------------------
// SCREEN 1
// ------------------
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.getValue(LocaleKey.screen1Title)!),
      ),
      //RESOLUTION: Remplacer le body par une liste simple en conservant la navigation
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext context, int i) {
          return ListItem(
            index: i + 1,
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                '/second',
                arguments: ScreenArguments('item', "${i + 1}"),
              );
            },
          );
        },
      ),
    );
  }
}

// ------------------
// SCREEN 2
// ------------------
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    //RESOLUTION: Comment récuperer l'argument dans l'écran ?
    final ScreenArguments args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.getValue(LocaleKey.screen2Title)!),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //RESOLUTION: afficher le title de l'argument
            Text('${localizations.getValue(LocaleKey.argTitle)} ${args.title}'),
            //RESOLUTION: afficher le message de l'argument
            Text(
                '${localizations.getValue(LocaleKey.argMessage)} ${args.message}'),
            ElevatedButton(
              //RESOLUTION: Implémenter la navigation retour
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Text('${localizations.getValue(LocaleKey.popButtonTitle)}'),
            ),
          ],
        ),
      ),
    );
  }
}
