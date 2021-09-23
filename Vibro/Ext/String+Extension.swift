////
////  String+Extension.swift
////  Gromi
////
////  Created by Ivan Apet on 15.02.21.
////
//
//import Foundation
//
//extension String {
//    var localized: String {
//        let language = UserDefaults.standard.get(key: .appLanguage) as? String ?? "en"
//        var path: String?
//        
//        path = Bundle.main.path(forResource: language, ofType: "lproj")
//        
//        let bundle = Bundle(path: path!)
//        
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "*\(self)*", comment: "")
//    }
//    
//    public func localized(code: String, arguments: [CVarArg]) -> String {
//        return String(format: self.hardLocalize(code: code), locale: nil, arguments: arguments)
//    }
//    
//    public func localized(arguments: [CVarArg]) -> String {
//        let code = UserDefaults.standard.get(key: .appLanguage) as? String ?? "en"
//        return String(format: self.hardLocalize(code: code), locale: nil, arguments: arguments)
//    }
//    
//    func hardLocalize(code: String) -> String {
//        var path: String?
//        
//        path = Bundle.main.path(forResource: code, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "*\(self)*", comment: "")
//    }
//    
//    var letters: String {
//        return String(unicodeScalars.filter(CharacterSet.letters.contains))
//    }
//}
//
//
