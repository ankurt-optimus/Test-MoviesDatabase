//
//  RequestModel.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation

import UIKit

enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class RequestModel {
    
    // MARK: - Properties
    var path: String {
        return ""
    }
    var parameters: [String: Any?] {
        return ["api_key":"38a73d59546aa378980a88b645f487fc&language=en-US&page=1"]
    }
    var headers: [String: String] {
        return [:]
    }
    var method: RequestHTTPMethod {
        return body.isEmpty ? RequestHTTPMethod.get : RequestHTTPMethod.post
    }
    var body: [String: Any?] {
        return [:]
    }
    
}

// MARK: - Public Functions
extension RequestModel {
    
    func urlRequest() -> URLRequest {
        var endpoint: String = NetworkService.shared.baseURL.appending(path)
        
        if parameters.keys.count > 0 {
            var count = 0
            for parameter in parameters {
                if let value = parameter.value as? String {
                    if count > 0 {
                        endpoint.append("&\(parameter.key)=\(value)")
                    } else {
                        endpoint.append("?\(parameter.key)=\(value)")
                    }
                }
                count = count + 1
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
//        var request: URLRequest = URLRequest(url: URL(string: "https://newsapi.org/v2//everything?q=tesla&sortBy=publishedAt&apiKey=c3aa7857d00a41dda4d938df991febf7")!)
        
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method == RequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                print("Request body parse error: \(error.localizedDescription)")
            }
        }
        
        return request
    }
}
