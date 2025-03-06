// 
//  OnboardingFactory.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import SwiftUI

struct OnboardingFactory {

    static func makeOnboarding() -> some View {

        // MARK: UseCases
        let createPin = CreatePinUseCase()
        
        // MARK: ViewModel
        let dependencies = OnboardingDependencies(createPin: createPin)
        let viewModel = OnboardingViewModel(dependencies: dependencies)

        return OnboardingView(viewModel: viewModel)
    }
}
