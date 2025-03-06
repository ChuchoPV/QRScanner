// 
//  OnboardingViewModel+Dependencies.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import SwiftUI
import Foundation

struct OnboardingDependencies {
    
    let createPin: CreatePinUseCaseType
}

enum OnboardingDestination {
    case biometrics
}
