import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'initialize_i18n/messages_all.dart';
import 'package:tuto_i18n_intl/constants.dart' show languages;

class MyLocalizations {
  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new MyLocalizations();
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  greetTo(name) => Intl.message("Nice to meet you, $name!",
      name: 'greetTo', desc: 'The application title', args: [name]);

  String get hello => Intl.message('Hello!', name: 'hello');
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) => false;
}
