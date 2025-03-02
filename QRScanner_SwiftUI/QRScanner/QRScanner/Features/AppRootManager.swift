//
//  AppRootManager.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-01-03
//

import Foundation

final class AppRootManager: ObservableObject {
    
    static let shared = AppRootManager()
    
    private init() {}
    
    @Published var currentRoot: Roots = .login
    
    enum Roots {
        case login
        case dashboard
    }
}
