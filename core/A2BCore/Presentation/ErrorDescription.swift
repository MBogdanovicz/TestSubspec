//
//  ErrorDescription.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 28/02/2021.
//

import Foundation

struct ErrorDescription {
    let title: String
    let message: String
    
    private init(_ title: String, _ message: String, debug: String? = nil) {
        self.title = title
        #if DEBUG
        if let debug = debug {
            self.message = "\(message)\nDEBUG: \(debug)"
        } else {
            self.message = message
        }
        #else
        self.message = message
        #endif
    }
    
    static func make(for error: Error?) -> ErrorDescription {
        if let error = error {
            return errorDescription(error)
        } else {
            return unknownErrorDescription()
        }
    }
    
    private static func unknownErrorDescription() -> ErrorDescription {
        #if DEBUG
        return ErrorDescription("🤷‍♂️", "error = nil")
        #else
        return ErrorDescription("_Error_", "An error occurred!")
        #endif
    }
    
    private static func errorDescription(_ error: Error) -> ErrorDescription {
        switch error {
        case let error as DecodingError:
            return decodingErrorDescription(error)
            
        default:
            return defaultErrorDescription(error)
        }
    }
    
    private static func defaultErrorDescription(_ error: Error) -> ErrorDescription {
        #if DEBUG
        return ErrorDescription("\(type(of: error))", error.localizedDescription)
        #else
        return unknownErrorDescription()
        #endif
    }
    
    private static func decodingErrorDescription(_ error: DecodingError) -> ErrorDescription {
        let message = error.localizedDescription
        switch error {
        case .typeMismatch(_, let context),
             .valueNotFound(_, let context),
             .keyNotFound(_, let context),
             .dataCorrupted(let context):
            return ErrorDescription("DecodingError", message, debug: context.codingPathDescription)
            
        @unknown default:
            return ErrorDescription("DecodingError", message)
        }
    }
}

extension DecodingError.Context {
    var codingPathDescription: String {
        codingPath.map{ $0.pathComponentDescription }.joined(separator: ".")
    }
}

extension CodingKey {
    var pathComponentDescription: String {
        switch intValue {
        case .none: return stringValue
        case .some(let i): return "\(i)"
        }
    }
}
