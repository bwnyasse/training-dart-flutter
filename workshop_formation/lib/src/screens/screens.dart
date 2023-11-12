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
 
  _loadMovies() async {
    // RESOLUTION : Charger les films à afficher depuis l'API MoviesDB
    final apiService = context.read<ApiService>();
    MoviesResponse response = await apiService.loadMovies();
    setState(() {
      movies = response.movies!;
    });
  }

  //RESOLUTION: Méthode qui construit votre drawer
  // Drawer is a ListView with entries
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Container(
            child: Image.asset(
              "assets/workshop-image.png",
              fit: BoxFit.cover,
            ),
          )),
          const ListTile(
            leading: const Icon(Icons.assessment),
            title: const Text('Example Menu 1'),
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Example Menu 2'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.getValue(LocaleKey.screen1Title)!),
      ),
      
      // RESOLUTION: Afficher le drawer
       drawer: _buildDrawer(context),

      //RESOLUTION: Remplacer le body par une liste simple en conservant la navigation
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          String originalTitle = movie.originalTitle!;
          String releaseDate = movie.releaseDate!;
          return ListItem(
            imgUrl: movie.posterPath == null
                ? 'https://via.placeholder.com/300'
                : 'http://image.tmdb.org/t/p/w185/${movie.posterPath}',
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