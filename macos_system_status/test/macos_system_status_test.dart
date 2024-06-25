import 'package:flutter_test/flutter_test.dart';
import 'package:macos_system_status/macos_system_status.dart';
import 'package:macos_system_status_macos/macos_system_status_macos.dart';
import 'package:macos_system_status_platform_interface/macos_system_status_platform_interface.dart';

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
