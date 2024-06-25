// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:macos_system_status/macos_system_status.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MacOSSytemStatusMacOS', () {
    late MacOSSytemStatusMacOS macOSSytemStatus;

    setUp(() async {
      macOSSytemStatus = MacOSSytemStatusMacOS();
      MacOSSytemStatusMacOS.registerWith();
    });

    test('can be registered', () {
      MacOSSytemStatusMacOS.registerWith();
      expect(
        MacOSSystemStatusPlatform.instance,
        isA<MacOSSytemStatusMacOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      await macOSSytemStatus.getSystemStatus().then((as) {
        print(as != null ? "asdasda" : "null");
      });
    });
  });
}
