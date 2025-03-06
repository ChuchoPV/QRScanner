//
//  OnboardingView.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import SwiftUI

struct OnboardingView<ViewModel: OnboardingViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Header(title: Titles.createPinTitle, subtitle: Titles.createPinSubtitle)
            
            OTPView(digits: $viewModel.digits)
                .padding(.horizontal)
            
            Spacer()
            
            CustomButton(label: Buttons.setupPIN, isLoading: $viewModel.isLoading) {
                viewModel.setupPIN()
                hideKeyboard()
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingFactory.makeOnboarding()
}
