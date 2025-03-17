import 'package:dart_frog/dart_frog.dart';

/// Middleware that adds CORS headers to the response.
Handler middleware(Handler handler) {
  return (context) async {
    // Get the response from the handler
    final response = await handler(context);

    // Add CORS headers to allow requests from all origins (for development)
    return response.copyWith(
      headers: {
        ...response.headers,
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers':
            'Origin, Content-Type, X-Auth-Token, Authorization',
        'Access-Control-Allow-Credentials': 'true',
      },
    );
  };
}