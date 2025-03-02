// 
//  PinFallbackViewFactory.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI

struct PinFallbackViewFactory {

    static func makePinFallbackView() -> some View {

        // MARK: UseCase
        let validatePin = ValidatePinUseCase()
        
        // MARK: ViewModel
        let dependencies = PinFallbackViewDependencies(validatePin: validatePin)
        let viewModel = PinFallbackViewViewModel(dependencies: dependencies)

        return PinFallbackViewView(viewModel: viewModel)
    }
}
