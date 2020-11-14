import 'package:json_annotation/json_annotation.dart';

//TODO : Générer le fichier `flutter pub run build_runner build --delete-conflicting-outputs`
part 'models.g.dart';

// ------------------
// MOVIES
// ------------------

@JsonSerializable()
class MoviesResponse {
  int page;

  //TODO: Mettre à Jour la clé en s'inspirant de l'API
  @JsonKey(name: 'A_RENSEIGNER')
  int totalResults;

  //TODO: Mettre à Jour la clé en s'inspirant de l'API
  @JsonKey(name: 'A_RENSEIGNER')
  int totalPages;

  @JsonKey(nullable: false, name: 'results')
  List<Movie> movies;

  MoviesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.movies,
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

  bool video;

  @JsonKey(name: 'vote_count')
  int voteCount;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  String title;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  bool adult;
  String overview;

  @JsonKey(name: 'gender_ids')
  List genreIds = [];

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  double popularity;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(defaultValue: false)
  bool favorite;

  Movie({this.id});

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
