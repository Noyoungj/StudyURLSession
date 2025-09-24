//
//  APIProvider.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

import Foundation

final class APIProvider {
    static let shared = APIProvider()
    private init() { }
    
    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async throws -> T {
        var request = URLRequest(url: endpoint.baseURL.appendingPathComponent(endpoint.path))
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            print(response)
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
