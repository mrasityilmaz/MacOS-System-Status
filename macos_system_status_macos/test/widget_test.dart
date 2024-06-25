// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_system_status_macos/macos_system_status_macos.dart';
import 'package:macos_system_status_platform_interface/macos_system_status_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterDocumentScannerIOS', () {
    const kPlatformName = 'macOS';
    late MacOSSytemStatusMacOS flutterDocumentScanner;
    late List<MethodCall> log;

    setUp(() async {
      flutterDocumentScanner = MacOSSytemStatusMacOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(flutterDocumentScanner.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getSystemStatus':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      MacOSSytemStatusMacOS.registerWith();
      expect(
        MacOSSystemStatusPlatform.instance,
        isA<MacOSSytemStatusMacOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      // final name = await flutterDocumentScanner.getPlatformName();
      // expect(
      //   log,
      //   <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      // );
      // expect(name, equals(kPlatformName));
    });
  });
}
