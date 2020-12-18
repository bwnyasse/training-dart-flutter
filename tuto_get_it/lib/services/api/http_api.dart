import 'package:http/http.dart' as http;
import 'package:tuto_get_it/services/api/api.dart';

class HttpApi implements Api {

  static const endpoint = 'https://myapi.com';

  final client = http.Client();

  Future<bool> likePost(int postId) async {
    final response = await client.post('$endpoint/likePost/$postId');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}