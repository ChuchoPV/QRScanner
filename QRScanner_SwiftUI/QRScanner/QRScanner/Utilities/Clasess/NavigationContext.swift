//
//  NavigationContext.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/4/25.
//

import SwiftUI
import Foundation

protocol NavigationType {
    func setRootView<T: View>(view: T)
    func push<T: View>(view: T, animated: Bool)
    func pop(animated: Bool)
    func present<T: View>(view: T, animated: Bool)
    func dismiss(animated: Bool)
}

class NavigationController: UINavigationController, NavigationType {
    
    func setRootView<T: View> (view: T) {
        let uiView = UIHostingController(rootView: view)
        self.viewControllers = [uiView]
    }
    
    func push<T: View>(view: T, animated: Bool) {
        let uiView = UIHostingController(rootView: view)
        self.pushViewController(uiView, animated: animated)
    }
    
    func pop(animated: Bool) {
        self.popViewController(animated: true)
    }
    
    func present<T: View> (view: T, animated: Bool) {
        let uiView = UIHostingController(rootView: view)
        uiView.modalTransitionStyle = .coverVertical
        uiView.modalPresentationStyle = .automatic
        self.present(uiView, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }
}
