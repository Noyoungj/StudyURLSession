//
//  DIContainer.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/24/25.
//

final class DIContainer {
    private let apiManager: APIProvider
    
    init(apiManager: APIProvider = .shared) {
        self.apiManager = apiManager
    }
    
    func makeUserListViewModel() -> viewModel {
        let userRepository: AuthRepository = AuthRepositoryImpl(provider: apiManager)
        let fetchUsersUseCase: LoginUsecase = LoginUseCaseImpl(repository: userRepository)
        return viewModel(doLoginUseCase: fetchUsersUseCase)
    }
}
