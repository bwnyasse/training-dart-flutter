import 'package:bloc/bloc.dart';
import 'package:tuto_flutter_bloc/src/blocs/impl/app_state.dart';
import 'package:tuto_flutter_bloc/src/services/services.dart';

class AppCubit extends Cubit<AppState> {
  final ApiService service;

  AppCubit({
    required this.service,
  }) : super(AppEmpty());

  void onErrorEvent() => emit(AppError());
  void onLoadingEvent() => emit(AppLoading());
  void onLoadEvent() async {
    emit(AppLoading());
    try {
      final list = await service.loadMovies();
      emit(AppLoaded(response: list));
    } catch (e) {
      print(e);
      emit(AppError());
    }
  }
}
