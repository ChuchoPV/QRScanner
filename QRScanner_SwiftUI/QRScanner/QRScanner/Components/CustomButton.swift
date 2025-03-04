//
//  CustomButton.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/3/25.
//

import SwiftUI

struct CustomButton: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.title3.bold())
                .frame(maxWidth: .infinity, maxHeight: Spacing.extraLarge)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CustomButton(label: "Button") {}
}
