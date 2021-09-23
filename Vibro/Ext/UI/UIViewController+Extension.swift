////
////  UIViewController+Extension.swift
////  Gromi
////
////  Created by Ivan Apet on 11.02.21.
////
//
//import UIKit
//
//extension UIViewController {
//    static func loadFromNib() -> Self {
//        func instantiateFromNib<T: UIViewController>() -> T {
//            return T.init(nibName: String(describing: T.self), bundle: nil)
//        }
//
//        return instantiateFromNib()
//    }
//    
//    @objc func endEditing() {
//        view.endEditing(true)
//    }
//    
//    func tapToCloseKeyboard() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(tap)
//    }
//    
//    func openWebView(urlString: String) {
//        guard let url = URL(string: urlString) else {return}
//        UIApplication.shared.open(url)
//    }
//    
//    var isModal: Bool {
//        
//        let presentingIsModal = presentingViewController != nil
//        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
//        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
//        
//        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
//    }
//    
//    func alert(title: String, message: String) -> UIAlertController {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor().hex("E3EDF7")
//        return alert
//    }
//}
