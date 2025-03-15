import 'package:flutter_modular/flutter_modular.dart';

import 'pages/trip_page.dart';

class TripModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const TripPage());
  }
}