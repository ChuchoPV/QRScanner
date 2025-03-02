//
//  LoginViewView.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI
import Combine

struct LoginViewView<ViewModel: LoginViewViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    var cancellables: [AnyCancellable] = []
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Image("Icon")
                    .renderingMode(.template)
                    .foregroundColor(.cyan)
                    .padding(.bottom)
                    .padding(.leading, Spacing.smaller)
                Button(Buttons.login, action: viewModel.login)
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity) 
                    .padding()
            }
            .padding()
            .navigationDestination(for: LoginRoutes.self) { route in
                switch route {
                case .fallback:
                    PinFallbackViewFactory.makePinFallbackView()
                }
            }
        }
    }
}

#Preview {
    LoginViewFactory.makeLoginView()
}
