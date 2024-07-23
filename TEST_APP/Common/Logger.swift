//
//  Logger.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import OSLog

extension Logger {
    static let viewCycle = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "viewcycle")
    static let system = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "system")
}

enum LogType {
    case debug, info, error

    var text: String {
        switch self {
        case .info:
            return "ℹ️"
        case .error:
            return "🔴"
        case .debug:
            return "🔵"
        }
    }
}

func log(type: LogType = .debug,
         logger: Logger = .viewCycle,
         _ items: Any...,
         separator: String = " ",
         file: String = #file,
         function: String = #function,
         line: Int = #line) {
    #if DEBUG || STAGING
    let fileName = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? file
    var array: [Any] = items
    array.insert("\(type.text) \(fileName) : \(function) : \(line) -***- ", at: 0)
    let msg = array.map { "\($0)" }.joined(separator: separator)
    switch type {
    case .debug:
        logger.debug("\(msg)")
    case .info:
        logger.info("\(msg)")
    case .error:
        logger.error("\(msg)")
    }
    #endif
}
