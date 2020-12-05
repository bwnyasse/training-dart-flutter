import 'package:pigeon/pigeon.dart';

class BatteryLevel {
  int value;
}


@HostApi()
abstract class Api {
  BatteryLevel getBatteryLevel();
}