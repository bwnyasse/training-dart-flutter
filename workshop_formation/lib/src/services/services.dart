import 'dart:convert';

import 'package:workshop_formation/src/models/models.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> _mockJson() => {
      "page": 1,
      "total_results": 3,
      "total_page": 1,
      "results": [
        {
          "release_date": "1994-09-10",
          "original_title": "The Shawshank Redemption",
        },
        {
          "release_date": "2014-10-10",
          "original_title": "Whiplash",
        },
        {
          "release_date": "1972-03-15",
          "original_title": "The Godfather",
        },
      ]
    };

class ApiService {
  //
  // Load Movies from Server
  //
  // TODO : Charger les films à afficher depuis l'API MoviesDB et renvoyer un Future<MoviesResponse>
  MoviesResponse loadMovies() => MoviesResponse.fromJson(_mockJson());
}
