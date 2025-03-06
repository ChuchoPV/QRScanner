//
//  LoginUseCaseUseCase.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/2/25.
//

import Combine
import LocalAuthentication

enum LoginStatus {
    case success
    case fallback
}

protocol LoginUseCaseType {
    func execute() -> AnyPublisher<LoginStatus, Never>
}

struct LoginUseCase: LoginUseCaseType {
    
    private let context = LAContext()
    
    func execute() -> AnyPublisher<LoginStatus, Never> {
        Future { promise in
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: Labels.authRequired) { success, error in
                    if success {
                        promise(.success(.success))
                    } else {
                        promise(.success(.fallback))
                    }
                }
            } else {
                promise(.success(.fallback))
            }
            
        }.eraseToAnyPublisher()
    }
}
