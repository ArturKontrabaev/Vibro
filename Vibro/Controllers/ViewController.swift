//
//  ViewController.swift
//  Vibro
//
//  Created by Контрабаев Артур on 13.09.2021.
//

import UIKit
import CoreHaptics

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //MARK: - test vibro
        var engine: CHHapticEngine?
        
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

            do {
                let pattern = try CHHapticPattern(events: [event], parameters: [])
                let player = try engine?.makePlayer(with: pattern)
                try player?.start(atTime: 0)
            } catch {
                print("Failed to play pattern: \(error.localizedDescription).")
            }
        }
        
    }
 
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
    }
}

