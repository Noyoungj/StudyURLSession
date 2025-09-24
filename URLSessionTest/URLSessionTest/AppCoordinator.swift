//
//  AppCoordinator.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/24/25.
//

import UIKit

final class AppCoordinator {
    private let container: DIContainer
    private let navigationController: UINavigationController
    
    init(container: DIContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = container.makeUserListViewModel()
        let vc = ViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: false)
    }
}

