// 
//  OnboardingViewModel.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {

    // MARK: Properties
    @Published var navigation = NavigationPath()
    @Published var isLoading = false
    @Published var digits: [String] = Array(repeating: "", count: 6)
    @Published var error: Error?

    // MARK: Private
    var cancellables: [AnyCancellable] = []
    let dependencies: OnboardingDependencies

    init(dependencies: OnboardingDependencies) {
        self.dependencies = dependencies
    }
    
    private var pin: String {
        digits.joined()
    }
    
    private var isOTPComplete: Bool {
        digits.allSatisfy { $0.count == 1 } && pin.count == 6
    }
}

// MARK: Inputs
extension OnboardingViewModel {
    
    func setupPIN() {
        
        guard isOTPComplete else {
            return
        }
        
        dependencies.createPin.execute(pin: self.pin)
            .receive(on: RunLoop.main)
            .sink { [weak self] result in
                
                guard let self else {
                    return
                }
                
                switch result {
                case .success:
                    print("Hello beibi")
                    self.navigation.append(OnboardingDestination.biometrics)
                case .failure(let error):
                    self.error = error
                }
            }.store(in: &cancellables)
    }
}
