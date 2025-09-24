//
//  Untitled.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

protocol AuthRepository {
    func postLogin(id: String, password: String) async throws -> PostLoginResponse
}
