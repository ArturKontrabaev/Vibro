//
//  SettingsViewController.swift
//  Vibro
//
//  Created by Контрабаев Артур on 20.09.2021.
//

import UIKit
import SafariServices

class SettingsViewController: UIViewController {
    
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        settingsTableView.backgroundColor = .black
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        
        settingsTableView.register(cellClass: type1SettingsCell.self)
        settingsTableView.register(cellClass: type2SettingsCell.self)
        settingsTableView.register(cellClass: emptySettingsCellTableViewCell.self)
    }
    
    func configureLayout(){
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4666666667, green: 0.1529411765, blue: 0.1803921569, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "SFProDisplay-Regular", size: 20)!]
        title = "Settings"
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(ofType: emptySettingsCellTableViewCell.self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(ofType: type1SettingsCell.self)
            cell.icon.image = #imageLiteral(resourceName: "rateUs")
            cell.label.text = "Rate Us"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(ofType: type1SettingsCell.self)
            cell.icon.image = #imageLiteral(resourceName: "shareApp")
            cell.label.text = "Share App"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(ofType: emptySettingsCellTableViewCell.self)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(ofType: type2SettingsCell.self)
            cell.label.text = "Privacy Policy"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(ofType: type2SettingsCell.self)
            cell.label.text = "Terms Of Use"
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(ofType: emptySettingsCellTableViewCell.self)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(ofType: type1SettingsCell.self)
            cell.icon.image = #imageLiteral(resourceName: "help")
            cell.label.text = "Help"
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(ofType: type1SettingsCell.self)
            cell.icon.image = #imageLiteral(resourceName: "rateUs")
            cell.label.text = "Rate Us"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 4:
            openUrl(K.policyLink)
        case 5:
            openUrl(K.termsLink)
        default:
            print ("not ready yet")
        }
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

