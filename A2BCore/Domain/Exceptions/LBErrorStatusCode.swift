//
//  LBErrorStatusCode.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 28/04/2021.
//

import Foundation

/**
 LBErrorStatusCode is contained in A2BCore framework
 import A2BCore in order to use it
 */
public enum LBErrorStatusCode: Equatable {
    
    /** notFound */
    case notFound
    /** unauthorized */
    case unauthorized
    /** timeout */
    case timeout
    /** badRequest */
    case badRequest
    /** forbidden */
    case forbidden
    /** internalServerError */
    case internalServerError
    /** badGateway */
    case badGateway
    /** parsing */
    case parsing
    /** database */
    case database
    /** serverUninitialized */
    case serverUninitialized
    /** databaseUninitialized */
    case databaseUninitialized
    /** unknown */
    case unknown(_ code: Int)
    
    init(_ code: Int) {
        
        switch code {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .internalServerError
        case 502:
            self = .badGateway
        default:
            self = .unknown(code)
        }
    }
    
    /** value string */
    public func value() -> String {
        
        var value: String!
        switch self {
        case .notFound:
            value = "Not Found"
        case .unauthorized:
            value = "Unauthorized"
        case .timeout:
            value = "Timeout"
        case .badRequest:
            value = "Bad Request"
        case .forbidden:
            value = "Forbidden"
        case .internalServerError:
            value = "Internal Server Error"
        case .badGateway:
            value = "Bad Gateway"
        case .parsing:
            value = "Parsing"
        case .database:
            value = "Database"
        case .serverUninitialized:
            value = "Server Uninitialized"
        case .databaseUninitialized:
            value = "Database Uninitialized"
        case .unknown(let code):
            value = "Unknown (\(code))"
        }
        
        return value
    }
}
