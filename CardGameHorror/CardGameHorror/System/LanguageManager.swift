//
//  LanguageManager.swift
//  CardGameHorror
//
//  Created by Eduardo on 24/07/23.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    //save user language preferences
       private let userDefaultsKey = "selectedLanguage"
       
       private(set) var currentLanguage: String {
           get {
               return UserDefaults.standard.string(forKey: userDefaultsKey) ?? "pt-BR"
           }
           set {
               UserDefaults.standard.set(newValue, forKey: userDefaultsKey)
           }
       }
    
    private init() {}
    // set the languege chossed
    func setLanguage(_ languageCode: String) {
        currentLanguage = languageCode
    }
    //get the string based on languege seted
    func localizedString(_ key: String) -> String {
        let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(key, tableName: "Localizable", bundle: bundle!, value: "", comment: "")
    }
    
    func localizedString(_ key: String, count: Int, total: Int) -> String {
        let format = localizedString(key)
        return String(format: format, count, total)
    }
}
