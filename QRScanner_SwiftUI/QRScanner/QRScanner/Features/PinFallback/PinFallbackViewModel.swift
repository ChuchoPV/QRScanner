//
//  PinFallbackViewViewModel.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01
//

import Foundation
import Combine

class PinFallbackViewViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var isLoading = false
    @Published var error: Error?
    @Published var digits: [String] = Array(repeating: "", count: 6)
    
    // MARK: Private
    var cancellables: [AnyCancellable] = []
    let dependencies: PinFallbackViewDependencies
    
    init(dependencies: PinFallbackViewDependencies) {
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
extension PinFallbackViewViewModel {
    
    func validateOTP() {
        guard isOTPComplete else {
            return
        }
        
        
    }
}
