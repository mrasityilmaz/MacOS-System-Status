import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:macos_system_status_platform_interface/macos_system_status_platform_interface.dart';

/// An implementation of [MacOSSystemStatusPlatform]
/// that uses method channels.
class MacOSSytemStatusMacOS extends MacOSSystemStatusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_system_status');

  @override
  Future<SystemStatusModel?> getSystemStatus({Set<SystemStatusTypeEnum>? systemStatusTypes}) async {
    try {
      final SystemStatusModel? systemStatusModel = await methodChannel.invokeMethod<SystemStatusModel?>(
        'methodName',
        <Object, Object>{},
      );

      if (systemStatusModel != null) {
        return systemStatusModel;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
