import 'package:bloc/bloc.dart';
import 'package:tuto_flutter_bloc/src/blocs/blocs.dart';
import 'package:tuto_flutter_bloc/src/services/services.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ApiService service;

  AppBloc({
    required this.service,
  }) : super(AppEmpty());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    //
    // ON ERROR EVENT
    //
    if (event is ErrorEvent) {
      yield AppError();
    }

    //
    // ON LOADING EVENT
    //
    if (event is LoadingEvent) {
      yield AppLoading();
    }

    //
    // ON LOAD EVENT
    //
    if (event is LoadEvent) {
      yield AppLoading();
      try {
        final list = await service.loadMovies();
        yield AppLoaded(response: list);
      } catch (e) {
        print(e);
        yield AppError();
      }
    }
  }
}
