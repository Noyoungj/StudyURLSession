//
//  AuthAPIManager.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//


final class AuthRepositoryImpl: AuthRepository {
    private let provider: APIProvider
    
    init(provider: APIProvider = .shared) {
        self.provider = provider
    }
    
    func postLogin(id: String, password: String) async throws -> PostLoginResponse {
        try await provider.request(AuthAPI.postLogin(id, password), type: PostLoginResponse.self)
    }
}
