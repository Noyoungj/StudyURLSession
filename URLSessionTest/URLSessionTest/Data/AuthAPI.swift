//
//  AuthAPI.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

import Foundation

enum AuthAPI: Endpoint {
    case postLogin(_ id: String, _ password: String)
    
    var path: String {
        switch self {
        case .postLogin: return "protocol/openid-connect/token"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postLogin: return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .postLogin(let id, let password):
            let parameters = [
                "client_id": "fleamarket-api",
                "grant_type": "password",
                "username": id,
                "password": password,
                "channel": "api"
                ]
//            return try? JSONSerialization.data(withJSONObject: parameters)
            return parameters.percentEncoded()
        default: return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postLogin:
            return [
                "appToken": "FCM Token",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
}

extension Dictionary where Key == String, Value == String {
    func percentEncoded() -> Data? {
        let parameterArray = self.map { key, value in
            let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let escapedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return "\(escapedKey)=\(escapedValue)"
        }
        .joined(separator: "&")
        
        print(parameterArray)
        return parameterArray.data(using: .utf8)
    }
}
