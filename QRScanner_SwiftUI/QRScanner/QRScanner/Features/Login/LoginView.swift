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
        NavigationStack(path: $viewModel.path) {
            VStack {
                Spacer()
                Image("Icon")
                    .renderingMode(.template)
                    .foregroundColor(.cyan)
                    .padding(.bottom)
                    .padding(.leading, Spacing.smaller)
                
                Spacer()
                
                CustomButton(label: Buttons.login, action: viewModel.login)
                .padding()
            }
            .padding()
            .navigationDestination(for: LoginRoutes.self) { route in
                switch route {
                case .fallback:
                    PinFallbackViewFactory.makePinFallbackView()
                case .createPin:
                    Text("Create pin view")
                }
            }
        }
    }
}

#Preview {
    LoginViewFactory.makeLoginView()
}
