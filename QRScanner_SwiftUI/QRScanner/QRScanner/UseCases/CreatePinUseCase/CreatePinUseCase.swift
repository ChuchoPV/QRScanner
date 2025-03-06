//
//  CreatePinUseCase.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import Combine
import Foundation

protocol CreatePinUseCaseType {
    func execute(pin: String) -> AnyPublisher<Result<Void, Error>, Never>
}

struct CreatePinUseCase: CreatePinUseCaseType {
    
    func execute(pin: String) -> AnyPublisher<Result<Void, Error>, Never> {
        Future<Result<Void, Error>, Never> { promise in
            promise(.success(self.savePinToKeychain(pin)))
        }.eraseToAnyPublisher()
    }
    
    private func savePinToKeychain(_ pin: String) -> Result<Void, Error> {
        let service = QRScannerConstants.bundle
        let account = "user"
        
        guard let pinData = pin.data(using: .utf8) else {
            return .failure(Errors.pinCannotEncoded)
        }
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: pinData
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            let error = NSError(domain: NSOSStatusErrorDomain, code: Int(status), userInfo: nil)
            return .failure(error)
        }
        
        return .success(())
    }
}
