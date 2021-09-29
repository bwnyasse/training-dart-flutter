import 'package:tuto_flutter_bloc/src/models/models.dart';

abstract class AppState {}

class AppError extends AppState {}

class AppEmpty extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final MoviesResponse response;

  AppLoaded({required this.response});
}
