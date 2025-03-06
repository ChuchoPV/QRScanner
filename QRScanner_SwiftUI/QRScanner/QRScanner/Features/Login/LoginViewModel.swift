//
//  LoginViewViewModel.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01
//

import SwiftUI
import Combine

class LoginViewViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var navigation = NavigationPath()
    @Published var isLoading = false
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
        
        guard QRScannerUserDefaults.hasCreatePin else {
            self.navigation.append(LoginDestination.onboarding)
            return
        }
        
        dependencies.login.execute()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] status in
                
                guard let self else {
                    return
                }
                
                self.navigation.append(LoginDestination.fallback)
            })
            .store(in: &cancellables)
    }
}
