//
//  welcomeAlert.swift
//  Vibro
//
//  Created by Контрабаев Артур on 22.09.2021.
//

import UIKit

class WelcomeAlertViewController: UIViewController {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!

    @IBOutlet weak var msg1: UILabel!
    @IBOutlet weak var msg2: UILabel!
    @IBOutlet weak var msg3: UILabel!
    
    override func viewDidLoad() {
      
        view.backgroundColor = .black.withAlphaComponent(0.5)
        
    }
}
