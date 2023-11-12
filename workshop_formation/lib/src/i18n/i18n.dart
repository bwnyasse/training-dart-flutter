import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

enum LocaleKey {
  title,
  screen1Title,
  screen2Title,
  popButtonTitle,
  argTitle,
  argMessage,
}

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

static AppLocalizations of(BuildContext context) {
  return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
}


 static Map<String, Map<String, String>> _localizedValues = {
    'fr': {
      "${LocaleKey.title}": 'Le Workshop de la formation',
      "${LocaleKey.screen1Title}": 'Ecran N°1',
      "${LocaleKey.screen2Title}": 'Ecran N°2',
      "${LocaleKey.popButtonTitle}": "via le pop : retour à l'écran précédent",
      "${LocaleKey.argTitle}": "le title de l'argument est :",
      "${LocaleKey.argMessage}": "le message de l'argument est :",
    },
    'en': {
      "${LocaleKey.title}": 'The training workshop',
      "${LocaleKey.screen1Title}": 'Screen N°1',
      "${LocaleKey.screen2Title}": 'Screen N°2',
      "${LocaleKey.popButtonTitle}": "pop method: go back to previous screen",
      "${LocaleKey.argTitle}": "the arg title is :",
      "${LocaleKey.argMessage}": "the arg message is :",
    },
  };

  String? getValue(LocaleKey key) => _localizedValues[locale.languageCode]?[key.toString()];
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
