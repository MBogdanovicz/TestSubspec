//
//  URLSessionExtension.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 17/03/2021.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

extension URLSession {
    
    public func dataTask(with url: String, method: HTTPMethod = .post, headers: [String: String]? = nil, parameters: [String: Any]? = nil, completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ statusCode: Int?, _ error: LBError?) -> Void) {
        
        do {
            var urlRequest = URLRequest(url: URL(string: url)!)
            
            if let parameters = parameters, method == .post {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } else if let parameters = parameters {
                var components = URLComponents(string: url)!
                var queryItems = [URLQueryItem]()
                
                parameters.forEach { (key, value) in
                    if let value = value as? String {
                        queryItems.append(URLQueryItem(name: key, value: value))
                    }
                }
                
                components.queryItems = queryItems
                
                urlRequest.url = URL(string: (components.url?.absoluteString.replacingOccurrences(of: "+", with: "%2B"))!)!
            }
            
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
                
                var statusCode: Int?
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                }
                
                var lbError: LBError? = nil
                
                if let statusCode = statusCode, statusCode >= 300 {
                    
                    if let data = data, let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let errorData = try? JSONDecoder().decode(ErrorResponse.self, from: JSONSerialization.data(withJSONObject: result)) {
                        
                        lbError = LBError(message: errorData.message, statusCode: statusCode, url: urlRequest.url?.absoluteString, headers: headers, parameters: parameters, method: method, error: error)
                    } else {
                        lbError = LBError(message: nil, statusCode: statusCode, url: urlRequest.url?.absoluteString, headers: headers, parameters: parameters, method: method, error: error)
                    }
                } else if let nsError = error as NSError? {
                    lbError = LBError(message: nsError.localizedDescription, statusCode: nsError.code, url: urlRequest.url?.absoluteString, headers: headers, parameters: parameters, method: method, error: nsError)
                }
                
                DispatchQueue.main.async {
                    completionHandler(data, response, statusCode, lbError)
                }
            }

            task.resume()
        } catch {
            let lbError = LBError(message: nil, statusCode: .parsing, url: url, headers: headers, parameters: parameters, method: method, error: error)
            DispatchQueue.main.async {
                completionHandler(nil, nil, nil, lbError)
            }
        }
    }
        
    public func dataTask(with url: String, method: HTTPMethod = .post, headers: [String : String]? = nil, parameters: [String : Any]? = nil, completionHandler: @escaping (_ data: [[String: Any]]?, _ response: URLResponse?, _ statusCode: Int?, _ error: LBError?) -> Void) {
        
        dataTask(with: url, method: method, headers: headers, parameters: parameters) { (data: Data?, response, statusCode, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
                return
            }
            
            if let statusCode = statusCode, statusCode >= 300 {
                
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
            } else if !data.isEmpty {
                
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    
                    DispatchQueue.main.async {
                        completionHandler(result, response, statusCode, error)
                    }
                } catch {
                    let lbError = LBError(message: nil, statusCode: .parsing, url: url, headers: headers, parameters: parameters, method: method, error: error)
                    DispatchQueue.main.async {
                        completionHandler(nil, response, statusCode, lbError)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler([], response, statusCode, error)
                }
            }
        }
    }
    
    public func dataTask(with url: String, method: HTTPMethod = .post, headers: [String : String]? = nil, parameters: [String : Any]? = nil, completionHandler: @escaping (_ data: [String: Any]?, _ response: URLResponse?, _ statusCode: Int?, _ error: LBError?) -> Void) {
        
        dataTask(with: url, method: method, headers: headers, parameters: parameters) { (data: Data?, response, statusCode, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
                return
            }
            
            if let statusCode = statusCode, statusCode >= 300 {
                
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
            } else if !data.isEmpty {
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    DispatchQueue.main.async {
                        completionHandler(result, response, statusCode, error)
                    }
                } catch {
                    let lbError = LBError(message: nil, statusCode: .parsing, url: url, headers: headers, parameters: parameters, method: method, error: error)
                    DispatchQueue.main.async {
                        completionHandler(nil, response, statusCode, lbError)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler([:], response, statusCode, error)
                }
            }
        }
    }
    
    public func dataTask<T: Codable>(with url: String, method: HTTPMethod = .post, headers: [String : String]? = nil, parameters: [String : Any]? = nil, completionHandler: @escaping (_ data: T?, _ response: URLResponse?, _ statusCode: Int?, _ error: LBError?) -> Void) {
        
        dataTask(with: url, method: method, headers: headers, parameters: parameters) { (data: [String: Any]?, response, statusCode, error) in
            
            if let data = data {
                do {
                    if let apiError = try? JSONDecoder().decode(ApiError.self, from: JSONSerialization.data(withJSONObject: data)), !apiError.isEmpty() {
                    
                        DispatchQueue.main.async {
                            completionHandler(nil, response, statusCode, apiError.toLBError(url: url, headers: headers, parameters: parameters, method: method))
                        }
                    } else {
                        let result = try JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: data))
                        
                        DispatchQueue.main.async {
                            completionHandler(result, response, statusCode, error)
                        }
                    }
                    
                } catch {
                    let lbError = LBError(message: nil, statusCode: .parsing, url: url, headers: headers, parameters: parameters, method: method, error: error)
                    DispatchQueue.main.async {
                        completionHandler(nil, response, statusCode, lbError)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
            }
        }
    }
    
    public func dataTask<T : Codable>(with url: String, method: HTTPMethod = .post, headers: [String : String]? = nil, parameters: [String : Any]? = nil, completionHandler: @escaping (_ data: [T]?, _ response: URLResponse?, _ statusCode: Int?, _ error: LBError?) -> Void) {
        
        dataTask(with: url, method: method, headers: headers, parameters: parameters) { (data: [[String: Any]]?, response, statusCode, error) in
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([T].self, from: JSONSerialization.data(withJSONObject: data))
                    
                    DispatchQueue.main.async {
                        completionHandler(result, response, statusCode, error)
                    }
                } catch {
                    let lbError = LBError(message: nil, statusCode: .parsing, url: url, headers: headers, parameters: parameters, method: method, error: error)
                    DispatchQueue.main.async {
                        completionHandler(nil, response, statusCode, lbError)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil, response, statusCode, error)
                }
            }
        }
    }
}
