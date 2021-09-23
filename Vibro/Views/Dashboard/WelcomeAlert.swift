//
//  welcomeAlert.swift
//  Vibro
//
//  Created by Контрабаев Артур on 22.09.2021.
//

import UIKit

class WelcomeAlert: UIView {
    
    static let instance = WelcomeAlert()
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!

    @IBOutlet weak var msg1: UILabel!
    @IBOutlet weak var msg2: UILabel!
    @IBOutlet weak var msg3: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("WelcomeAlert", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
     
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
    }
    
    func showAlert (){
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(alertView)
    }
}
