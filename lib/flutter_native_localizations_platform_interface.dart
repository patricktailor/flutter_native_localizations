import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_native_localizations_method_channel.dart';

abstract class FlutterNativeLocalizationsPlatform extends PlatformInterface {
  /// Constructs a FlutterNativeLocalizationsPlatform.
  FlutterNativeLocalizationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNativeLocalizationsPlatform _instance = MethodChannelFlutterNativeLocalizations();

  /// The default instance of [FlutterNativeLocalizationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNativeLocalizations].
  static FlutterNativeLocalizationsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNativeLocalizationsPlatform] when
  /// they register themselves.
  static set instance(FlutterNativeLocalizationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
