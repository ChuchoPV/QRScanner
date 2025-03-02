//
//  PinFallbackViewView.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-03-01.
//

import SwiftUI

struct PinFallbackViewView<ViewModel: PinFallbackViewViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    @FocusState private var focusedField: Int?
    
    let white = Color.white
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Header(title: Titles.enterPinTitle,
                   subtitle: Titles.enterPinSubtitle)
            HStack(spacing: Spacing.smaller) {
                ForEach(0..<viewModel.digits.count, id: \.self) { index in
                    OTPDigitView(
                        text: $viewModel.digits[index],
                        isActive: focusedField == index
                    )
                    .focused($focusedField, equals: index)
                    .onChange(of: viewModel.digits[index]) { newValue in
                        processOTPInput(at: index, newValue: newValue)
                    }
                }
            }
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
        .onAppear {
            focusedField = 0
        }
    }
    
    private func processOTPInput(at index: Int, newValue: String) {
        
        print("index: \(index) with newValue: \(newValue)")
        guard newValue.count <= 1 else {
            viewModel.digits[index] = String(newValue.suffix(1))
            return
        }
        
        if newValue.count == 1 && index < 5 {
            focusedField = index + 1
        }
        
        if newValue.isEmpty && index > 0 {
            focusedField = index - 1
        }
    }
}

#Preview {
    PinFallbackViewFactory.makePinFallbackView()
}
