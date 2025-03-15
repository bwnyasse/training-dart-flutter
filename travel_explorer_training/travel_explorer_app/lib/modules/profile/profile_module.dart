import 'package:flutter_modular/flutter_modular.dart';

import 'pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfilePage());
  }
}