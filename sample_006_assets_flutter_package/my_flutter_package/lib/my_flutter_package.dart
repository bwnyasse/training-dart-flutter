import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformVersion extends StatelessWidget {
  final String version;
  final String  index;
  PlatformVersion({
    @required this.index,
    @required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('images/android-$index.png', package: 'my_flutter_package')),
        Text('Running on: $version\n'),
      ],
    );
  }
}

class MyFlutterPackage {
  static const MethodChannel _channel = const MethodChannel('my_flutter_package');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
