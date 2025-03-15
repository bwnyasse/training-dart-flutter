import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/map/map_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/trip/trip_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    // Global dependencies will go here
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/map', module: MapModule());
    r.module('/profile', module: ProfileModule());
    r.module('/trip', module: TripModule());
  }
}