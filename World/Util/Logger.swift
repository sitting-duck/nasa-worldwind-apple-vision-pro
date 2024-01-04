import Foundation

public struct Severity {
    static let levelNone: Int = 0
    static let levelSevere: Int = 1
    static let levelWarning: Int = 2
    static let levelInfo: Int = 3
}

public struct MessageTable {
    static let values: [String: String] = [
        "abstractInvocation": "The function called is abstract and must be overridden in a subclass.",
        "asymmetricMatrix": "The specified matrix is not symmetric.",
        // ... other key-value pairs ...
        "webglNotSupported": "The browser does not support WebGL, or WebGL is disabled."
    ]
}

public class Logger {
    public static var Level = Severity.self
    public static var messageTable = MessageTable.self
    private static var loggingLevel: Int = Logger.Level.levelSevere

    public static func setLoggingLevel(level: Int) {
        Logger.loggingLevel = level
    }

    public static func getLoggingLevel() -> Int {
        return Logger.loggingLevel
    }

    public static func log(level: Int, message: String, stack: String? = nil) {
        if !message.isEmpty && level > 0 && level <= Logger.loggingLevel {
            switch level {
            case Severity.levelSevere:
                print("Error: \(message)")
            case Severity.levelWarning:
                print("Warning: \(message)")
            case Severity.levelInfo:
                print("Info: \(message)")
            default:
                print(message)
            }
            if let stackTrace = stack {
                print("Stack: \(stackTrace)")
            }
        }
    }

    public static func logMessage(level: Int, className: String, functionName: String, message: String, stack: String? = nil) -> String {
        let msg = "\(className).\(functionName): \(message)"
        Logger.log(level: level, message: msg, stack: stack)
        return msg
    }
}
