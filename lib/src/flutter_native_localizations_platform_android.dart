import 'package:flutter_native_localizations/src/bindings/jni.g.dart';
import 'package:flutter_native_localizations/src/platform_interface.dart';
import 'package:jni/jni.dart';

class FlutterNativeLocalizationsPlatformAndroid extends PlatformInterface {
  FlutterNativeLocalizationsPlatformAndroid() {
    try {
      final context = Jni.getCachedApplicationContext();
      if (context.isNull) {
        throw StateError('Cannot obtain Android application context');
      }

      final jObject = JObject.fromReference(context);
      _plugin = FlutterNativeLocalizationsPlugin(jObject);
    } catch (e) {
      throw StateError('Failed to initialize Flutter Native Localizations: $e');
    }
  }
  
  late final FlutterNativeLocalizationsPlugin _plugin;

  @override
  String? getString(String key) {
    try {
      final jKey = key.toJString();
      final value = _plugin.getString(jKey);
      jKey.release();

      return value?.toDartString(releaseOriginal: true);
    } on Exception {
      return null;
    }
  }
}
