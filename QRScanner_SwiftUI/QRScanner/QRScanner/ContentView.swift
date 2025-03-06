//
//  ContentView.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/1/25.
//

import Combine
import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginViewFactory.makeLoginView()
    }
}

#Preview {
    ContentView()
}
