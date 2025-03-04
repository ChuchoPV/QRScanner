//
//  UserDefaults.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/3/25.
//

import Foundation

struct QRScannerUserDefaults {
    
    private init() {}
    
    private enum DefaultsKeys: String {
        case hasCreatePin
    }
    
    private static var defaults: UserDefaults? {
        return UserDefaults(suiteName: "com.jpv.qrscanner.app.defaults")
    }
}

// MARK: - First Opens
extension QRScannerUserDefaults {
    
    static var hasCreatePin: Bool {
        get {
            return defaults?.bool(forKey: DefaultsKeys.hasCreatePin.rawValue) ?? false
        }
        set {
            defaults?.set(newValue, forKey: DefaultsKeys.hasCreatePin.rawValue)
            defaults?.synchronize()
        }
    }
}
