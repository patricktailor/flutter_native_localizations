import 'dart:io';

import 'package:flutter_native_localizations/src/flutter_native_localizations_platform_android.dart';
import 'package:flutter_native_localizations/src/platform_interface.dart';

class FlutterNativeLocalizationsPlatformFactory {
  PlatformInterface createFor() {
    if (Platform.isAndroid) {
      return FlutterNativeLocalizationsPlatformAndroid();
    } else {
      throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
    }
  }
}
