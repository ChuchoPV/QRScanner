//
//  Labels+Extensions.swift
//  QRScanner
//
//  Created by Jesus Perea on 2025-01-03
//


import Foundation

enum TableName: String {
    case errors = "Errors"
    case login = "Login"
    case placeholders = "Placeholders"
    case verification = "Verification"
    case buttons = "Buttons"
    case labels = "Labels"
    case alerts = "Alerts"
    case titles = "Titles"
}

extension String {
    
    func localized(from tableName: TableName) -> String {
        
        guard let bundle = Bundle(identifier: "com.jpv.qrscanner") else {
            return ""
        }
        
        return NSLocalizedString(self, tableName: tableName.rawValue, bundle: bundle, value: "", comment: "")
    }
    
    func localized(from tableName: TableName, arguments: [String]) -> String {
        return String(format: self.localized(from: tableName), arguments: arguments)
    }
}
