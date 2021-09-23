//
//  OnboardingViewController.swift
//  Vibro
//
//  Created by Контрабаев Артур on 14.09.2021.
//

import UIKit
import SwiftVideoBackground
import SafariServices

class OnboardingViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var enableVirationLabel: UILabel!
    @IBOutlet weak var enableVibrationSwitch: UISwitch!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var andLabel: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    
    @IBOutlet weak var enableVibrationStackView: UIStackView!
    
    var currentScreen = 1
    
    @IBAction func termsButtonPressed(_ sender: UIButton) {
        openUrl(K.termsLink)
    }
    
    @IBAction func privacyButtonPressed(_ sender: UIButton) {
        openUrl(K.policyLink)
    }
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        welcomeLabel.fadeTransition(0.7)
        enableVirationLabel.fadeTransition(0.7)
        switch currentScreen {
        case 1:
            currentScreen += 1
            playVideo()
            welcomeLabel.text = "High speed and intensity!"
            enableVirationLabel.text = "Enable high speed & intensity"
        case 2:
            currentScreen += 1
            playVideo()
            welcomeLabel.text = "Try all modes and tools!"
            enableVirationLabel.text = "Enable free trial"
        case 3:
            let alert = UIAlertController(title: "Skip Free Trial?",
                message: "Free trial available only for the first app launch. Mostly of our users start with free trial and decide pay or not to pay later.",
                preferredStyle: .alert)
            
            let startTrialAction = UIAlertAction(title: "Start Free Trial", style: .default) { action in
                
            }
            let skipTrialAction = UIAlertAction(title: "Skip", style: .default) { action in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(startTrialAction)
            alert.addAction(skipTrialAction)
            present(alert, animated: true, completion: nil)
        default:
            currentScreen = 1
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()

    }

    func configureLayout() {
        
        playVideo()
        welcomeLabel.text = "Welcome to Massager!"
        welcomeLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        welcomeLabel.textColor = .white
        
        welcomeMessageLabel.text = "Vibration massage on your phone!  Having joy and relaxing has never been easier. Find your mode from the 12 suggested. Let’s start!"
        welcomeMessageLabel.font = UIFont(name: "SF-Pro-Text-Regular", size: 18)
        welcomeMessageLabel.textColor = .systemGray
        
        enableVirationLabel.text = "Enable vibration"
        enableVirationLabel.textColor = .white
        enableVirationLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        
        enableVibrationSwitch.onTintColor = #colorLiteral(red: 1, green: 0, blue: 0.253893137, alpha: 1)
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.layer.masksToBounds = true
        continueButton.layer.cornerRadius = 12
        continueButton.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.253893137, alpha: 1)
        continueButton.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        continueButton.setTitleColor(.white, for: .normal)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Roboto-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.systemGray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
                string: "Terms of Service",
                attributes: attributes
             )
        
        termsButton.setAttributedTitle(attributeString, for: .normal)
        
        andLabel.text = " & "
        andLabel.textColor = .systemGray
        andLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        
        attributeString = NSMutableAttributedString(
                string: "Privacy Policy",
                attributes: attributes
             )
    
        privacyButton.setAttributedTitle(attributeString, for: .normal)
   
        
        enableVibrationStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        enableVibrationStackView.isLayoutMarginsRelativeArrangement = true
        enableVibrationStackView.layer.borderWidth = 1
        enableVibrationStackView.layer.cornerRadius = 26
        enableVibrationStackView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    func playVideo() {
        try? VideoBackground.shared.play(
            view: view,
            videoName: "onb\(Int.random(in: 1...3))",
            videoType: "mp4",
            isMuted: true,
            darkness: 0.6,
            willLoopVideo: true,
            setAudioSessionAmbient: true
        )
    }
    
    func openUrl(_ link:String){
        if let url = URL(string: link) {
                          let config = SFSafariViewController.Configuration()
                          config.entersReaderIfAvailable = true

                          let vc = SFSafariViewController(url: url, configuration: config)
                          present(vc, animated: true)
                      }

    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

