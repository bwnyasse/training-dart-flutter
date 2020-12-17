import 'package:flutter/material.dart';
import 'package:tuto_flutter_bloc/src/models/models.dart';
import 'package:tuto_flutter_bloc/src/widgets/widgets.dart';

class MoviesList extends StatelessWidget {
  final MoviesResponse response;

  MoviesList({@required this.response});

  @override
  Widget build(BuildContext context) {
    final movies = response.movies;
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movies[index];
        return MovieCard(
          data: movie,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
