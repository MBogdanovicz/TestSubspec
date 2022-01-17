//
//  LBError.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 13/04/2021.
//

import Foundation

/**
 LBError is contained in A2BCore framework
 import A2BCore in order to use it
 */
public struct LBError: Error {
    
    /** message */
    public let message: String?
    /** statud Code */
    public let statusCode: LBErrorStatusCode?
    /** url */
    public let url: String?
    /** headers */
    public let headers: [String: String]?
    /** parameters */
    public let parameters: [String: Any]?
    /** method */
    public let method: HTTPMethod?
    /** error */
    public let error: Error?
    
    public init(message: String? = nil, statusCode: Int? = nil, url: String? = nil, headers: [String: String]? = nil, parameters: [String: Any]? = nil, method: HTTPMethod? = nil, error: Error?) {
        self.message = message ?? error?.localizedDescription
        self.statusCode = statusCode != nil ? LBErrorStatusCode(statusCode!) : nil
        self.url = url
        self.headers = headers
        self.parameters = parameters
        self.method = method
        self.error = error
    }
    
    public init(message: String? = nil, statusCode: LBErrorStatusCode?, url: String? = nil, headers: [String: String]? = nil, parameters: [String: Any]? = nil, method: HTTPMethod? = nil, error: Error? = nil) {
        self.message = message ?? error?.localizedDescription
        self.statusCode = statusCode
        self.url = url
        self.headers = headers
        self.parameters = parameters
        self.method = method
        self.error = error
    }
    
    public func mapToNSError() -> NSError {
        var userInfo = [String: Any]()
        
        if let message = self.message {
            userInfo["message"] = message
        }
        
        if let statusCode = self.statusCode {
            userInfo["statusCode"] = statusCode
        }
        
        userInfo["url"] = url
        
        if let headers = self.headers {
            userInfo["headers"] = headers
        }
        
        if let parameters = self.parameters {
            userInfo["parameters"] = parameters
        }
        
        if let method = self.method {
            userInfo["method"] = method
        }
        
        if let error = self.error {
            userInfo["error"] = error
        }
        
        return NSError(domain: "LBError", code: 0, userInfo: userInfo)
    }
}
