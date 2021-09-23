//
//  DashboardViewController.swift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit
import CoreHaptics
import AVFoundation


class DashboardViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    @IBOutlet var dashboardTableView: UITableView!
    public var chosenIntensity = K.Intensity.soft
    public var chosenSpeed: Float?
    public var chosenMode: String?
    
    @IBAction func settingsBarButtonPressed(_ sender: UIBarButtonItem) {
        let settingsVC = (storyboard?.instantiateViewController(identifier: "settingsVC"))!
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    // A haptic engine manages the connection to the haptic server.
    var engine: CHHapticEngine?
    
    // Maintain a variable to check for Core Haptics compatibility on device.
    lazy var supportsHaptics: Bool = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.supportsHaptics
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLaunch()
        
        createEngine()
        
        dashboardTableView.register(cellClass: turnOnVibroCell.self)
        dashboardTableView.register(cellClass: intensityCell.self)
        dashboardTableView.register(cellClass: speedCell.self)
        dashboardTableView.register(cellClass: modesCell.self)
        
        dashboardTableView.dataSource = self
        dashboardTableView.delegate = self
        dashboardTableView.backgroundColor = .black
        dashboardTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureLayout ()
    }
    
    /// - Tag: CreateEngine
    func createEngine() {
    
        // Create and configure a haptic engine.
        do {
            // Associate the haptic engine with the default audio session
            // to ensure the correct behavior when playing audio-based haptics.
            let audioSession = AVAudioSession.sharedInstance()
            engine = try CHHapticEngine(audioSession: audioSession)
        } catch let error {
            print("Engine Creation Error: \(error)")
        }
        
        guard let engine = engine else {
            print("Failed to create engine!")
            return
        }
        
        // The stopped handler alerts you of engine stoppage due to external causes.
        engine.stoppedHandler = { reason in
            print("The engine stopped for reason: \(reason.rawValue)")
            switch reason {
            case .audioSessionInterrupt:
                print("Audio session interrupt")
            case .applicationSuspended:
                print("Application suspended")
            case .idleTimeout:
                print("Idle timeout")
            case .systemError:
                print("System error")
            case .notifyWhenFinished:
                print("Playback finished")
            case .gameControllerDisconnect:
                print("Controller disconnected.")
            case .engineDestroyed:
                print("Engine destroyed.")
            @unknown default:
                print("Unknown error")
            }
        }
        
        // The reset handler provides an opportunity for your app to restart the engine in case of failure.
        engine.resetHandler = {
            // Try restarting the engine.
            print("The engine reset --> Restarting now!")
            do {
                try self.engine?.start()
            } catch {
                print("Failed to restart the engine: \(error)")
            }
        }
    }
    
    /// - Tag: PlayAHAP
    func playHapticsFile(named filename: String) {
        
        // If the device doesn't support Core Haptics, abort.
        if !supportsHaptics {
            return
        }
        
        // Express the path to the AHAP file before attempting to load it.
        guard let path = Bundle.main.path(forResource: filename, ofType: "ahap") else {
            return
        }
        
        do {
            // Start the engine in case it's idle.
            try engine?.start()
            
            // Tell the engine to play a pattern.
            try engine?.playPattern(from: URL(fileURLWithPath: path))
            
        } catch { // Engine startup errors
            print("An error occured playing \(filename): \(error).")
        }
    }
    
    func firstLaunch(){
        // let onboardingVC = (storyboard?.instantiateViewController(identifier: "oboardingVC"))!

       // present(onboardingVC, animated: true, completion: nil)

        WelcomeAlert.instance.showAlert()
  

    }
    
    func configureLayout (){
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
        settingsBarButton.image = #imageLiteral(resourceName: "settingsButton")
        settingsBarButton.tintColor = .white
    }
}

//MARK: - UITable Delegate + Data Source
extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(ofType: turnOnVibroCell.self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(ofType: intensityCell.self)
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(ofType: speedCell.self)
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(ofType: modesCell.self)
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}

//MARK: - Cells Delegates
extension DashboardViewController: IntensityCellDelegate, SpeedCellDelegate, ModesCellDelegate {
    func setNewMode(selectedMode: String) {
        chosenMode = selectedMode
        
        //setting current mode label
        let cell = dashboardTableView.cellForRow(at: [0,0]) as! turnOnVibroCell
        cell.selectedModeLabel.text = chosenMode
    }
    
    func setNewIntensity(selectedIntensity: K.Intensity) {
        chosenIntensity = selectedIntensity
    }
    
    func setNewSpeed(selectedSpeed: Float) {
        chosenSpeed = selectedSpeed
    }
}
