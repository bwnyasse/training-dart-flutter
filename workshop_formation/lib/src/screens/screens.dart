import 'package:flutter/material.dart';
import 'package:workshop_formation/src/i18n/i18n.dart';

import 'package:workshop_formation/src/models/models.dart';
import 'package:workshop_formation/src/services/services.dart';
import 'package:workshop_formation/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

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

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  _loadMovies() {
    //TODO : Valoriser apiService
    final apiService = null;
    MoviesResponse response = apiService.loadMovies();
    movies = response.movies;
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.getValue(LocaleKey.screen1Title)!),
      ),
      //RESOLUTION: Remplacer le body par une liste simple en conservant la navigation
      //TODO: Comprendre la mise à jour de la liste pour afficher les movies
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          String originalTitle = movie.originalTitle;
          String releaseDate = movie.releaseDate;
          return ListItem(
            data: "$originalTitle - Date : $releaseDate",
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                '/second',
                arguments: ScreenArguments(originalTitle, releaseDate),
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
