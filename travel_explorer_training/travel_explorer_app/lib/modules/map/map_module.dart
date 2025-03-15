import 'package:flutter_modular/flutter_modular.dart';

import 'pages/map_page.dart';

class MapModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MapPage());
  }
}