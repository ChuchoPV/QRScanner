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
    @Published var error: Error?
    @Published var path = [LoginRoutes]()
    
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
        
        guard QRScannerUserDefaults.hasCreatePin else {
            AppRootManager.shared.currentRoot = .onboarding
            return
        }
    
        dependencies.login.execute()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] status in
                
                guard let self else {
                    return
                }
                
                
                self.path.append(.fallback)
            })
            .store(in: &cancellables)
    }
}
