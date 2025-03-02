//
//  LoginViewView.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI

struct LoginViewView<ViewModel: LoginViewViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let white = Color.white
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image("Icon")
                .renderingMode(.template)
                .foregroundColor(.cyan)
                .padding(.bottom)
                .padding(.leading, Spacing.smaller)
            Button(Buttons.login, action: viewModel.login)
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding()
            
            switch viewModel.loginStatus {
            case .success:
                Text("Sucess")
            case .fallback:
                Text("Failure")
            case .none:
                EmptyView()
            }
        }
        .padding()
    }
}

#Preview {
    LoginViewFactory.makeLoginView()
}
