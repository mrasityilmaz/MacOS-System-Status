import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:macos_system_status_platform_interface/macos_system_status_platform_interface.dart';

/// An implementation of [MacOSSystemStatusPlatform]
/// that uses method channels.

class MacOSSytemStatusMacOS extends MacOSSystemStatusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_system_status_macos');

  /// Registers this class as the default instance
  /// of [MacOSSystemStatusPlatform]
  static void registerWith() {
    MacOSSystemStatusPlatform.instance = MacOSSytemStatusMacOS();
  }

  @override
  Future<SystemStatusModel?> getSystemStatus({Set<SystemStatusTypeEnum>? systemStatusTypes}) async {
    try {
      final SystemStatusModel? systemStatusModel = await methodChannel.invokeMethod<String?>('getSystemStatus', {"types": systemStatusTypes?.map((e) => e.name).toList()}).then((stringValue) {
        if (stringValue != null) {
          return SystemStatusModel.fromJson(json.decode(stringValue));
        }
        return null;
      });

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
