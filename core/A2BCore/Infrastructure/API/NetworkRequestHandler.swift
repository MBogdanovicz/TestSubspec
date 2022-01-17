//
//  NetworkRequestHandler.swift
//  LinkBeyond
//
//  Created by Marcelo Bogdanovicz on 03/01/2021.
//  Copyright © 2021 A-to-Be. All rights reserved.
//

import Foundation

public class NetworkRequestHandler {
    
    private init() {}
    
    public static func apiRequest<T : Any>(request: () throws -> T, exceptionMapper: (_: Error) -> Error) throws -> T {
        do {
            return try request()
        } catch {
            throw exceptionMapper(error)
        }
    }

    public static func apiRequest<T : Any>(request: () -> T) -> T {
        return request()
    }

//    static func defaultExceptionMapper(exception: Exception): Exception { return when (exception) {
//            is retrofit2.HttpException -> NetworkException(exception.code(), exception.message)
//            is UnknownHostException -> InvalidConnectionException(exception.message) //TODO: check network connectivity in okhttp interceptor
//            else -> exception
//        }
//    }
}
