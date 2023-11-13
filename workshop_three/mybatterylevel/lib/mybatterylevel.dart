import 'mybatterylevel_platform_interface.dart';

import 'dart:async';

import 'app_device_helper.dart';

class Mybatterylevel {
  static AppDeviceHelper get _api {
    return AppDeviceHelper();
  }

  static Future<int> get batteryLevel async {
    return await _api.getBatteryLevel();
  }

  Future<String?> getPlatformVersion() {
    return MybatterylevelPlatform.instance.getPlatformVersion();
  }
}
