import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AppDeviceHelper {
  int getBatteryLevel();
}