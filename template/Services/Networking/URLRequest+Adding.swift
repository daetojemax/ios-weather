//
//  URLRequest+Adding.swift
//  template
//
//  Created by Максим Ермолаев on 30.06.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

extension URLRequest {
    
    func addingAuth(login: String, password: String) -> URLRequest {
        let loginString = String(format: "%@:%@", login, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        var newRequest = self
        newRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        return newRequest
    }
    
    func addingMethod(_ method: HTTPMethod) -> URLRequest {
        var newRequest = self
        newRequest.httpMethod = method.rawValue
        if method == .POST {
            newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return newRequest
    }
    
    func addingData(_ data: [String: AnyObject]) -> URLRequest {
        var newRequest = self
        newRequest.httpBody = data.toData()
        return newRequest
    }
}
