import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:tuto_flutter_bloc/src/models/impl/mock_movies.dart' as mock;
import 'package:tuto_flutter_bloc/src/models/models.dart';

class LoadMoviesException implements Exception {
  final message;

  LoadMoviesException(this.message);
}

class ApiService {
  final Client client;

  ApiService(this.client);

  MoviesResponse loadMockMovies() => MoviesResponse.fromJson(mock.mockJson());

  Future<MoviesResponse> loadMovies() async {
    final apiKey = '4205ec1d93b1e3465f636f0956a98c64';
    final api = 'https://api.themoviedb.org/3';
    final urlPath = 'movie/now_playing';
    final path = '$api/$urlPath?api_key=$apiKey&language=en-US';

    // appel asynchrone
    final response = await client.get(path);

    if (response.statusCode != 200) {
      throw LoadMoviesException(
          'LoadMovies - Request Error: ${response.statusCode}');
    }

    // Décoder le contenu de la response ici
    final data = json.decode(response.body);

    return MoviesResponse.fromJson(data);
  }
}
