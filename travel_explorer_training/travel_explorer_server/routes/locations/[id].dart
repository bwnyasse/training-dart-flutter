import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:travel_explorer_server/repositories/location_repository.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  // We only want to handle GET requests
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  try {
    final repository = LocationRepository();
    final location = await repository.getLocationById(id);
    
    if (location == null) {
      return Response.json(
        statusCode: HttpStatus.notFound,
        body: {'error': 'Location not found'},
      );
    }
    
    return Response.json(body: location);
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {'error': e.toString()},
    );
  }
}