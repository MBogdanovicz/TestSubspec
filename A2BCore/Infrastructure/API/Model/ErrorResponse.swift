//
//  ErrorResponse.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 17/03/2021.
//

import Foundation

struct ErrorResponse: Codable {
    
    let message: String
    let errorCode: String?
}
