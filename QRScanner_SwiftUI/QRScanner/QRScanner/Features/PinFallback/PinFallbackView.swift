//
//  PinFallbackViewView.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI

struct PinFallbackViewView<ViewModel: PinFallbackViewViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let white = Color.white
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Header(title: Titles.enterPinTitle,
                   subtitle: Titles.enterPinSubtitle)
            
            OTPView(digits: $viewModel.digits)
                .padding()
            
            Spacer()
            
            Button(action: viewModel.validateOTP) {
                Text(Buttons.validatePIN)
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, maxHeight: Spacing.extraLarge)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    PinFallbackViewFactory.makePinFallbackView()
}
