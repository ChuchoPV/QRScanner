//
//  LoginViewViewModel.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01
//

import Foundation
import Combine

class LoginViewViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var isLoading = false
    @Published var loginStatus: LoginStatus?
    @Published var error: Error?
    
    // MARK: Private
    var cancellables: [AnyCancellable] = []
    let dependencies: LoginViewDependencies
    
    init(dependencies: LoginViewDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: Inputs
extension LoginViewViewModel {
    
    func login() {
        dependencies.login.execute()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            } receiveValue: { [weak self] status in
                self?.loginStatus = status
            }
            .store(in: &cancellables)
    }
}
