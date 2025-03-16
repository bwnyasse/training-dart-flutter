import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_explorer/modules/genai/bloc/genai_bloc.dart';
import 'package:travel_explorer/modules/genai/gen_ai.module.dart';
import 'package:travel_explorer/modules/genai/repositories/genai_repository.dart';
import 'package:travel_explorer/modules/map/bloc/map_bloc.dart';
import 'package:travel_explorer/modules/map/repositories/map_repository.dart';
import 'package:travel_explorer/modules/map/pages/map_page.dart';

class MapModule extends Module {
  @override
  List<Module> get imports => [GenAIModule()];

  @override
  void binds(i) {
    // Register MapRepository as a singleton
    i.addSingleton<MapRepository>(MapRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MapBloc(mapRepository: Modular.get<MapRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                GenAIBloc(repository: Modular.get<GenAIRepository>()),
          ),
        ],
        child: const MapPage(),
      ),
    );
  }
}
