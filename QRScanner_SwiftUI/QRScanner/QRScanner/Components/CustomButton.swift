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
    @Binding var isLoading: Bool
    
    init(label: String, isLoading: Binding<Bool>, action: @escaping () -> Void) {
        self.label = label
        self.action = action
        self._isLoading = isLoading
    }
    
    var body: some View {
        Button(action: action) {
            if isLoading {
                Text("Loading")
            } else {
                Text(label)
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, maxHeight: Spacing.extraLarge)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CustomButton(label: "Button", isLoading: .constant(false)) {}
}
