//
//  OTPView.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/3/25.
//

import SwiftUI

struct OTPView: View {
    
    @Binding var digits: [String]
    @FocusState private var focusedField: Int?
    
    var body: some View {
        HStack(spacing: Spacing.smaller) {
            ForEach(0..<digits.count, id: \.self) { index in
                OTPDigitView(
                    text: $digits[index],
                    isActive: focusedField == index
                )
                .focused($focusedField, equals: index)
                .onChange(of: digits[index]) { newValue in
                    processOTPInput(at: index, newValue: newValue)
                }
            }
        }
        .onAppear {
            focusedField = 0
        }
    }
    
    private func processOTPInput(at index: Int, newValue: String) {
        guard newValue.count <= 1 else {
            digits[index] = String(newValue.suffix(1))
            return
        }
        
        if newValue.count == 1 && index < 5 {
            focusedField = index + 1
        }
        
        if newValue.isEmpty && index > 0 {
            print("Here")
            focusedField = index - 1
        }
    }
}

#Preview {
    OTPView(digits: .constant(Array(repeating: "", count: 6)))
}
