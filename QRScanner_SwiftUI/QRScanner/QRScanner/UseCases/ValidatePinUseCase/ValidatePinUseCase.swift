//
//  ValidatePinUseCase.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/2/25.
//

import Combine

enum ValidatePin {
    case success
    case error(String)
}

protocol ValidatePinUseCaseType {
    func execute() -> AnyPublisher<ValidatePin, Never>
}

struct ValidatePinUseCase: ValidatePinUseCaseType {
    
    func execute() -> AnyPublisher<ValidatePin, Never>{
        return Just(.success).eraseToAnyPublisher()
    }
}
