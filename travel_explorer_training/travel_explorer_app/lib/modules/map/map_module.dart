import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_explorer/modules/map/bloc/map_bloc.dart';
import 'package:travel_explorer/modules/map/repositories/map_repository.dart';
import 'package:travel_explorer/modules/map/pages/map_page.dart';

class MapModule extends Module {
  @override
  void binds(i) {
    // Register MapRepository as a singleton
    i.addSingleton<MapRepository>(MapRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => BlocProvider(
        create: (_) => MapBloc(mapRepository: Modular.get<MapRepository>()),
        child: const MapPage(),
      ),
    );
  }
}