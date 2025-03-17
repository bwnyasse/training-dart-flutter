import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:travel_explorer_server/repositories/location_repository.dart';

Future<Response> onRequest(RequestContext context) async {
  // We only want to handle GET requests
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  try {
    final repository = LocationRepository();
    final locations = await repository.getLocations();
    return Response.json(body: locations);
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {'error': e.toString()},
    );
  }
}