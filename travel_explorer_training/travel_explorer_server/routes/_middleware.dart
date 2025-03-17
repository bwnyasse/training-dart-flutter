import 'package:dart_frog/dart_frog.dart';
import 'package:travel_explorer_server/middleware/cors.dart' as cors;

Handler middleware(Handler handler) {
  return handler.use(cors.middleware);
}