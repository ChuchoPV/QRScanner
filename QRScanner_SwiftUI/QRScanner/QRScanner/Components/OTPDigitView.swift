//
//  OTPDigitView.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/2/25.
//

import SwiftUI

struct OTPDigitView: View {
    @Binding var text: String
    let isActive: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isActive ? Color.primary : Color.gray, lineWidth: 2)
                .frame(width: 50, height: 60)
            
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .font(.title)
                .foregroundColor(isActive ? .primary : .gray)
        }
    }
}


#Preview {
    OTPDigitView(text: .constant("2"), isActive: false)
}
