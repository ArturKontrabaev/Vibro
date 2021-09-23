//
//  NSObject+Extension.swift
//  Gromi
//
//  Created by Ivan Apet on 11.02.21.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
