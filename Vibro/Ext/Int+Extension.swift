//
//  Int+Extension.swift
//  Gromi
//
//  Created by Ivan Apet on 12.03.21.
//

import Foundation

extension Int {
    func secondsToMinutesSeconds() -> (String, String) {
        let mins = ((self % 3600) / 60)
        let sMins = mins > 9 ? "\(mins)" : "0\(mins)"
        
        let sec = (self % 3600) % 60
        let sSec = sec > 9 ? "\(sec)" : "0\(sec)"
        
        return (sMins, sSec)
    }
    
    func secondsToINTMinutesSeconds() -> (Int, Int) {
        let mins = ((self % 3600) / 60)        
        let sec = (self % 3600) % 60
        return (mins, sec)
    }
    
    func convertToMinSec() -> (hours: Int, minutes: Int, seconds: Int) {
        return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    func convertMinsTo() -> (hours: Int, minutes: Int) {
        return (self / 60, (self % 60) % 60)
    }
}

