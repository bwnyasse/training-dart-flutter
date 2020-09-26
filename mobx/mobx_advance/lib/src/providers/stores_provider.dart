import 'package:flutter/material.dart';
import 'package:mobx_advance/src/api/weather_api.dart';
import 'package:mobx_advance/src/stores/weather_store.dart';
import 'package:provider/provider.dart';

class StoresProvider extends StatelessWidget {
  final Widget child;

  StoresProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherStore>(create: (_) => WeatherStore(FakeWeatherAPI())),
      ],
      child: child,
    );
  }
}
