import FlutterMacOS
import Cocoa

public class MacOSSystemStatusPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "macos_system_status_macos", binaryMessenger: registrar.messenger)
        let instance = MacOSSystemStatusPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "getSystemStatus":
        do {
            guard let arguments = call.arguments as? [String: Any],
                  let flutterEnums = arguments["types"] as? [String] else {
                throw ErrorsPlugin.stringError("Invalid Arguments")
            }

            let systemServicesEnums = flutterEnums.compactMap { convertToSystemServicesEnum($0) }
            
            let systemStatusService = SystemStatusService()
            let systemStatus = systemStatusService.getSystemStatus(for: systemServicesEnums)
            
           if let jsonString = systemStatus.toJSON() {
                result(jsonString)
            } else {
                result(FlutterError(
                    code: "MacOSSystemStatusPlugin-Error",
                    message: "Encoding Error",
                    details: "Failed to encode SystemStatusModel to JSON"
                ))
            }
        } catch {
            result(FlutterError(
                code: "MacOSSystemStatusPlugin-Error",
                message: "getSystemStatus \(error.localizedDescription)",
                details: error
            ))
        }
    default:
        result(FlutterMethodNotImplemented)
    }
}
}
