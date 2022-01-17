//
//  API.swift
//  Subspec
//
//  Created by Marcelo Bogdanovicz on 17/01/2022.
//

import Foundation
import A2BCore

public class API {
    
    public let shared = API()
    
    private init() {}
    
    public func osVersion(completion: @escaping (_ data: [String: Any]?, _ error: LBError?) -> Void) {
        
        URLSession.shared.dataTask(with: "https://dev.a-to-be.com/mtolling/os-versions/IOS", method: .get) { (data, response, statusCode, error) in
            completion(data, error)
        }
    }
}
