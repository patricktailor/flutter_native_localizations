import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_localizations/flutter_native_localizations.dart';
import 'package:flutter_native_localizations/flutter_native_localizations_platform_interface.dart';
import 'package:flutter_native_localizations/flutter_native_localizations_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNativeLocalizationsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNativeLocalizationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNativeLocalizationsPlatform initialPlatform = FlutterNativeLocalizationsPlatform.instance;

  test('$MethodChannelFlutterNativeLocalizations is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNativeLocalizations>());
  });

  test('getPlatformVersion', () async {
    FlutterNativeLocalizations flutterNativeLocalizationsPlugin = FlutterNativeLocalizations();
    MockFlutterNativeLocalizationsPlatform fakePlatform = MockFlutterNativeLocalizationsPlatform();
    FlutterNativeLocalizationsPlatform.instance = fakePlatform;

    expect(await flutterNativeLocalizationsPlugin.getPlatformVersion(), '42');
  });
}
