import 'package:flutter_test/flutter_test.dart';
import 'package:mybatterylevel/mybatterylevel.dart';
import 'package:mybatterylevel/mybatterylevel_platform_interface.dart';
import 'package:mybatterylevel/mybatterylevel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMybatterylevelPlatform
    with MockPlatformInterfaceMixin
    implements MybatterylevelPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MybatterylevelPlatform initialPlatform = MybatterylevelPlatform.instance;

  test('$MethodChannelMybatterylevel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMybatterylevel>());
  });

  test('getPlatformVersion', () async {
    Mybatterylevel mybatterylevelPlugin = Mybatterylevel();
    MockMybatterylevelPlatform fakePlatform = MockMybatterylevelPlatform();
    MybatterylevelPlatform.instance = fakePlatform;

    expect(await mybatterylevelPlugin.getPlatformVersion(), '42');
  });
}
