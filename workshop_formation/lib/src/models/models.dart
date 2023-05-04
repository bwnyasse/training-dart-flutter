import 'package:json_annotation/json_annotation.dart';

//NB : Générer le fichier `flutter pub run build_runner build --delete-conflicting-outputs`
part 'models.g.dart';

// ------------------
// MOVIES
// ------------------

@JsonSerializable()
class MoviesResponse {
  int page;

  // API: https://developers.themoviedb.org/3/movies/get-top-rated-movies
  @JsonKey(name: 'total_results')
  int totalResults;

  @JsonKey(name: 'total_pages')
  int totalPages;

  @JsonKey(name: 'results')
  List<Movie> movies;

  MoviesResponse({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}

//---------------
// ENTRY MOVIE
//---------------
@JsonSerializable()
class Movie {
  int id;

  bool video = false;

  @JsonKey(name: 'vote_count')
  int voteCount = 0;

  @JsonKey(name: 'vote_average')
  double voteAverage = 0;

  String title = "";

  @JsonKey(name: 'poster_path')
  String posterPath = "";

  @JsonKey(name: 'original_language')
  String originalLanguage = "";

  @JsonKey(name: 'original_title')
  String originalTitle = "";

  bool adult = false;
  String overview = "";

  @JsonKey(name: 'genre_ids')
  List genreIds = [];

  @JsonKey(name: 'backdrop_path')
  String backdropPath = "";

  double popularity = 0;

  @JsonKey(name: 'release_date')
  String releaseDate = "";

  @JsonKey(defaultValue: false)
  bool favorite = false;

  Movie({required this.id});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

// ------------------
// SCREEN ARGUMENTS
// ------------------
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
