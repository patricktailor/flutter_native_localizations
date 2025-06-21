import 'package:flutter_native_localizations/flutter_native_localizations.dart';
import 'package:flutter_native_localizations/flutter_native_localizations_method_channel.dart';
import 'package:flutter_native_localizations/flutter_native_localizations_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNativeLocalizationsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNativeLocalizationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final initialPlatform = FlutterNativeLocalizationsPlatform.instance;

  test('$MethodChannelFlutterNativeLocalizations is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNativeLocalizations>());
  });

  test('getPlatformVersion', () async {
    final flutterNativeLocalizationsPlugin = FlutterNativeLocalizations();
    final fakePlatform = MockFlutterNativeLocalizationsPlatform();
    FlutterNativeLocalizationsPlatform.instance = fakePlatform;

    expect(await flutterNativeLocalizationsPlugin.getPlatformVersion(), '42');
  });
}
