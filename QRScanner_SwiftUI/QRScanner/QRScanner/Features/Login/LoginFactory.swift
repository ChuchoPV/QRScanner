// 
//  LoginViewFactory.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI

struct LoginViewFactory {

    static func makeLoginView() -> some View {

        // MARK: UseCase
        let login = LoginUseCase()
        
        // MARK: ViewModel
        let dependencies = LoginViewDependencies(login: login)
        let viewModel = LoginViewViewModel(dependencies: dependencies)

        return LoginViewView(viewModel: viewModel)
    }
}
