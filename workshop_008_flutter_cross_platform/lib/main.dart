/*
 * Dart & Flutter - Training
 * 
 * Copyright (c) Boris-Wilfried Nyasse
 * All rights reserved
*/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workshop_008_flutter_cross_platform/src/i18n/i18n.dart';
import 'package:workshop_008_flutter_cross_platform/src/provider/providers.dart';
import 'package:workshop_008_flutter_cross_platform/src/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvider(
          child: MaterialApp(
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.getValue(LocaleKey.title)!,
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fr',''), // French, no country code
          const Locale('en',''),// English, no country code
        ],
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
      ),
    );
  }
}
