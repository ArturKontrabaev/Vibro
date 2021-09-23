//
//  UIViewController+Extension.swift
//  Gromi
//
//  Created by Ivan Apet on 11.02.21.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func tapToCloseKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    func openWebView(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        UIApplication.shared.open(url)
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
