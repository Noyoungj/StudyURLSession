//
//  ViewController.swift
//  URLSessionTest
//
//  Created by 노영재(Youngjae No)_인턴 on 9/23/25.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel: viewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.doPostLogin()
    }

    init(viewModel: viewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class viewModel {
    private let doLoginUseCase: LoginUsecase
    
    init(doLoginUseCase: LoginUsecase) {
        self.doLoginUseCase = doLoginUseCase
    }
    
    func doPostLogin() {
        Task {
            do {
                let result = try await doLoginUseCase.execute(id: "yj.no14@konai.com", password: "Kona!234")
                print("\(result)")
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}
