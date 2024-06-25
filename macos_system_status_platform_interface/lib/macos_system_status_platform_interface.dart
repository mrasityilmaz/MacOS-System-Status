// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:macos_system_status_platform_interface/src/Enums/system_status_type.dart';
import 'package:macos_system_status_platform_interface/src/Models/system_status/system_status_model.dart';
import 'package:macos_system_status_platform_interface/src/method_channel_macos_system_status.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:macos_system_status_platform_interface/src/Enums/system_status_type.dart';
export 'package:macos_system_status_platform_interface/src/Models/battery_status/battery_status_model.dart';
export 'package:macos_system_status_platform_interface/src/Models/cpu_usage_info/cpu_usage_info_model.dart';
export 'package:macos_system_status_platform_interface/src/Models/disk_space/disk_space_model.dart';
export 'package:macos_system_status_platform_interface/src/Models/memory_statistics/memory_statistics_model.dart';
export 'package:macos_system_status_platform_interface/src/Models/system_status/system_status_model.dart';
export 'package:macos_system_status_platform_interface/src/method_channel_macos_system_status.dart';

/// The interface that implementations of flutter_document_scanner
/// must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `MacOSSystemStatus`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added
///  [MacOSSystemStatusPlatform] methods.
abstract class MacOSSystemStatusPlatform extends PlatformInterface {
  /// Constructs a FlutterDocumentScannerPlatform.
  MacOSSystemStatusPlatform() : super(token: _token);

  static final Object _token = Object();

  static MacOSSystemStatusPlatform _instance = MethodChannelMacOSSytemStatus();

  /// The default instance of [MacOSSystemStatusPlatform] to use.
  ///
  /// Defaults to [MethodChannelMacOSSytemStatus].
  static MacOSSystemStatusPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MacOSSystemStatusPlatform] when
  /// they register themselves.
  static set instance(MacOSSystemStatusPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Example
  Future<SystemStatusModel?> getSystemStatus({Set<SystemStatusTypeEnum>? systemStatusTypes}) {
    throw UnimplementedError('fetchStatusExample() has not been implemented.');
  }
}
