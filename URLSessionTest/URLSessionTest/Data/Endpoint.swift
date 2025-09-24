//
//  Endpoint.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

extension Endpoint {
    var baseURL: URL { URL(string: "https://dev-auth.ncp-konai.com/realms/ncp/")! }
    var headers: [String: String]? { ["Content-Type": "application/json"] }
    var body: Data? { nil }
}
