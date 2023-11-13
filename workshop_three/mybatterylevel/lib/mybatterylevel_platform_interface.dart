import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mybatterylevel_method_channel.dart';

abstract class MybatterylevelPlatform extends PlatformInterface {
  /// Constructs a MybatterylevelPlatform.
  MybatterylevelPlatform() : super(token: _token);

  static final Object _token = Object();

  static MybatterylevelPlatform _instance = MethodChannelMybatterylevel();

  /// The default instance of [MybatterylevelPlatform] to use.
  ///
  /// Defaults to [MethodChannelMybatterylevel].
  static MybatterylevelPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MybatterylevelPlatform] when
  /// they register themselves.
  static set instance(MybatterylevelPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
