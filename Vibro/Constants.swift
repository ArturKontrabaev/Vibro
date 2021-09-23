//
//  Constants.swift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit

struct K {
    static let SCREEN_SIZE = UIScreen.main.bounds
    static let turnOnVibroCell = "turnOnVibroCell"
    static let intensityCell = "intensityCell"
    static let speedCell = "speedCell"
    static let modesCell = "modesCell"
    static let modeCell = "modeCell"
    
    static let selectedColor = #colorLiteral(red: 0.7333333333, green: 0.1843137255, blue: 0.2352941176, alpha: 1)
    static let deselectedColor = #colorLiteral(red: 0.4666666667, green: 0.1529411765, blue: 0.1803921569, alpha: 1)
    enum Intensity {
        case soft
        case medium
        case hard
    }
    
    static let termsLink = "https://docs.google.com/document/d/1jDwvRCP3Eos8BO792ysRJb7nO0QQbBv13E8H6HN65CE/edit?usp=sharing"
    
    static let policyLink = "https://docs.google.com/document/d/1xa0uH-IBwmwSf9MsLLlAJ6p-a42ksmmJskjANdrv1N0/edit?usp=sharing"
    
    static let modes: [(name: String,image: UIImage)] = [
        ("Waves",#imageLiteral(resourceName: "mode_waves")),
        ("Breeze",#imageLiteral(resourceName: "mode_breeze")),
        ("Monsoon",#imageLiteral(resourceName: "mode_monsoon")),
        ("Hurricane",#imageLiteral(resourceName: "mode_hurricane")),
        ("Volcano",#imageLiteral(resourceName: "mode_volcano mde")),
        ("Tsunami",#imageLiteral(resourceName: "mode_tsunami")),
        ("Typhoon",#imageLiteral(resourceName: "mode_typhoon")),
        ("Storm",#imageLiteral(resourceName: "mode_storm")),
        ("Lava",#imageLiteral(resourceName: "mode_lava")),
        ("Billow",#imageLiteral(resourceName: "mode_billow")),
        ("Quake",#imageLiteral(resourceName: "mode_quake")),
        ("Tornado",#imageLiteral(resourceName: "mode_tornado")),
    ]
 }
