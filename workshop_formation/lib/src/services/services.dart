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
  // RESOLUTION : Charger les films à afficher depuis l'API MoviesDB et renvoyer un Future<MoviesResponse>
  Future<MoviesResponse> loadMovies() async {
    final apiKey = '4205ec1d93b1e3465f636f0956a98c64';
    final api = 'https://api.themoviedb.org/3';
    final urlPath = 'movie/now_playing';
    final path = Uri.parse('$api/$urlPath?api_key=$apiKey&language=en-US');

    // appel asynchrone
    final response = await http.Client().get(path);

    // Décoder le contenu de la response ici
    final data = json.decode(response.body);

    return MoviesResponse.fromJson(data);
  }
}
