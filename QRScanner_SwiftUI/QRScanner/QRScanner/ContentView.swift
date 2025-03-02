//
//  ContentView.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/1/25.
//

import Combine
import SwiftUI

struct ContentView: View {
    
    @State var cancellable = Set<AnyCancellable>()
    @StateObject private var appRootManager = AppRootManager.shared
    
    var body: some View {
        Group {
            switch appRootManager.currentRoot {
            case .login:
                LoginViewFactory.makeLoginView()
                
            case .dashboard:
                Text("Dashboard")
            }
        }.environmentObject(appRootManager)
    }
}

#Preview {
    ContentView()
}
