import 'package:flutter/widgets.dart';
import 'package:flutter_native_localizations/src/flutter_native_localizations_platform_factory.dart';
import 'package:flutter_native_localizations/src/platform_interface.dart';

class FlutterNativeLocalizations {
  final Locale locale;
  final PlatformInterface _platform;

  FlutterNativeLocalizations._(this.locale) : _platform = FlutterNativeLocalizationsPlatformFactory().createFor();

  static FlutterNativeLocalizations? of(BuildContext context) {
    return Localizations.of<FlutterNativeLocalizations>(context, FlutterNativeLocalizations);
  }

  static const LocalizationsDelegate<FlutterNativeLocalizations> delegate = _FlutterNativeLocalizationsDelegate();

  String? getString(String resourceName) {
    return _platform.getString(resourceName);
  }

  static Future<FlutterNativeLocalizations> _load(Locale locale) async {
    final instance = FlutterNativeLocalizations._(locale);
    return instance;
  }
}

class _FlutterNativeLocalizationsDelegate extends LocalizationsDelegate<FlutterNativeLocalizations> {
  const _FlutterNativeLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<FlutterNativeLocalizations> load(Locale locale) {
    return FlutterNativeLocalizations._load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<FlutterNativeLocalizations> old) {
    return true;
  }
}
