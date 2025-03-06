//
//  LoginViewView.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI
import Combine

struct LoginView<ViewModel: LoginViewViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    var cancellables: [AnyCancellable] = []
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navigation) {
            VStack {
                Spacer()
                Image("Icon")
                    .renderingMode(.template)
                    .foregroundColor(.cyan)
                    .padding(.bottom)
                    .padding(.leading, Spacing.smaller)
                
                Spacer()
                
                CustomButton(label: Buttons.login,
                             isLoading: $viewModel.isLoading,
                             action: viewModel.login)
                .padding()
            }
            .padding()
            .navigationDestination(for: LoginDestination.self) { destination in
                switch destination {
                case .home:
                    Text("Home")
                case .onboarding:
                    OnboardingFactory.makeOnboarding()
                    .navigationBarBackButtonHidden()
                case .fallback:
                    PinFallbackViewFactory.makePinFallbackView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    LoginViewFactory.makeLoginView()
}
