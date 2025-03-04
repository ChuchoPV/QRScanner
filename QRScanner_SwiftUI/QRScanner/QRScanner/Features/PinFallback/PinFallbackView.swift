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
            
            CustomButton(label: Buttons.validatePIN, action: viewModel.validateOTP)
        }
        .padding()
    }
}

#Preview {
    PinFallbackViewFactory.makePinFallbackView()
}
