
import 'dart:async';

import 'messages.dart';

class Mybatterylevel {

  static Api _apiInstance;

    static Api get _api {
    if (_apiInstance == null) {
      _apiInstance = Api();
    }
    return _apiInstance;
  }

  static Future<int> get batteryLevel async {
    BatteryLevel level = await _api.getBatteryLevel();
    return level.value;
  }

}
