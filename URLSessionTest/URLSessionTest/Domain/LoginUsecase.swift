//
//  LoginUsecase.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

protocol LoginUsecase {
    func execute(id: String, password: String) async throws -> PostLoginResponse
}

final class LoginUseCaseImpl: LoginUsecase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(id: String, password: String) async throws -> PostLoginResponse {
        try await repository.postLogin(id: id, password: password)
    }
}
