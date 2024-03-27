import Foundation

// MARK: - Swift Logger implemention

// enum to represent the log level
enum LogLevel {
    case warning
    case info
    case error
    
    fileprivate var prefix: String {
        switch self {
        case .error:     return "ERROR ❌"
        case .info:      return "INFO ℹ️"
        case .warning:   return "WARNING ⚠️"
        }
    }
}


// MARK: - Context
struct Context {
    let file: String
    let function: String
    let line: Int
    
    fileprivate var description: String {
        "\((file as NSString).lastPathComponent) :\(line) \(function)"
    }
}

// MARK: - Final Logger Implementation
enum Log {
    private static func handleLog(logLevel: LogLevel, str: String, shouldShowContext: Bool, context: Context) {
        let logComponents = ["\(logLevel.prefix)", str]
        
        var fullLogString = logComponents.joined(separator: " ")
        
        if shouldShowContext {
            fullLogString += " => \(context.description)"
        }
        
        
        print(fullLogString)
    }
    
    static func info(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line, shouldShowContext: Bool = true) {
        let context = Context(file: file,
                              function: function,
                              line: line)
        
        Log.handleLog(logLevel: .info,
                      str: str.description,
                      shouldShowContext: shouldShowContext,
                      context: context)
    }
    
    static func error(_ str: StaticString,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line,
                      shouldShowContext: Bool = true) {
        
        let context = Context(file: file,
                              function: function,
                              line: line)
        
        Log.handleLog(logLevel: .error,
                      str: str.description,
                      shouldShowContext: shouldShowContext,
                      context: context)
    }
    
    static func warning(_ str: StaticString,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line,
                      shouldShowContext: Bool = true) {
        
        let context = Context(file: file,
                              function: function,
                              line: line)
        
        Log.handleLog(logLevel: .warning,
                      str: str.description,
                      shouldShowContext: shouldShowContext,
                      context: context)
    }
}

Log.warning("This is a warning")
Log.error("This is an error")
