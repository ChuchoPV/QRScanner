// 
//  DashboardViewViewModel+Dependencies.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-01-03
//

import Foundation

struct LoginViewDependencies {
    
    let login: LoginUseCaseType
}

enum LoginDestination: Hashable {
    case home
    case onboarding
    case fallback
}
