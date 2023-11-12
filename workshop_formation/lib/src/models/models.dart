import 'package:json_annotation/json_annotation.dart';

//TODO : Générer le fichier `flutter pub run build_runner build --delete-conflicting-outputs`
part 'models.g.dart';

// ------------------
// MOVIES
// ------------------

@JsonSerializable()
class MoviesResponse {

  int? page;

  //TODO: Mettre à Jour la clé en s'inspirant de l'API
  @JsonKey(name: 'A_RENSEIGNER')
  int? totalResults;

  //TODO: Mettre à Jour la clé en s'inspirant de l'API
  @JsonKey(name: 'A_RENSEIGNER')
  int? totalPages;

  @JsonKey(name: 'results', defaultValue: [])
  List<Movie>? movies;

  MoviesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    List<Movie>? movies,
  }) : movies = movies ?? [];

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}

//---------------
// ENTRY MOVIE
//---------------
@JsonSerializable()
class Movie {

  int? id;

  bool? video;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  String? title;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  bool? adult;

  String? overview;

  @JsonKey(name: 'gender_ids')
  List<int>? genreIds;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  double? popularity;

  @JsonKey(name: 'release_date')
  String? releaseDate;
  
  bool favorite;

  Movie({
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.adult,
    this.overview,
    this.genreIds,
    this.backdropPath,
    this.popularity,
    this.releaseDate,
    this.favorite = false, // Default value provided
  });

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
