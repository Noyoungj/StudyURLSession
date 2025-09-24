//
//  PostLoginResponse 2.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

public struct PostLoginResponse: Codable {
    public var access_token: String?
    public var refresh_token: String?
}
