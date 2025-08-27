//
//  Untitled.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 8.8.2025.
//

import Foundation

struct LanguageManager {
    
    func setDefaultLanguage() {
        
        if !UserDefaults.standard.bool(forKey: "hasSetDefaultLanguage") {
            
            let currentLocale = Locale.current
            let languageCode = currentLocale.languageCode ?? "en"
            
            switch languageCode {
                case "fi":
                    UserDefaults.standard.set("fi", forKey: "userLanguage")
                    // Set Finnish-specific settings here
                case "en":
                    UserDefaults.standard.set("en", forKey: "userLanguage")
                    // Set English-specific settings here
                default:
                    UserDefaults.standard.set("en", forKey: "userLanguage")
            }
            
            UserDefaults.standard.set(true, forKey: "hasSetDefaultLanguage")
            print("Default language set: \(UserDefaults.standard.string(forKey: "userLanguage") ?? "undefined language")")
        } else {
            print("Default language already set")
        }
    }
    
    func setLanguage(languageIdentifier: String) {
        switch languageIdentifier {
        case "fi":
            UserDefaults.standard.set("fi", forKey: "userLanguage")
            print("App language changed to Finnish")
            Bundle.setLanguage("fi")
            
        case "en":
            UserDefaults.standard.set("en", forKey: "userLanguage")
            print("App language changed to English")
            Bundle.setLanguage("en")
            
        default:
            print("Cannot change app language: invalid identifier")
        }
        
    }
    
    func getSelectedLanguage() -> String {
        let language = UserDefaults.standard.string(forKey: "userLanguage") ?? "en"
        return language
    }
    
    func checkDeviceLocalization() {
        let currentLocale = Locale.current
        let languageCode = currentLocale.languageCode ?? "unknow"
        print("Device locale: \(languageCode)")
    }
    
    func localizedString(forKey key: String) -> String {
        let languageCode = Bundle.currentLanguage() // e.g. "en" or "fi"
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(key, comment: "") // fallback
        }
        
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
    
    
}

extension Bundle {
    // This function sets the app's language to the given language code.
    class func setLanguage(_ languageCode: String) {
        // Set the language in UserDefaults
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }

    // Helper function to get the current language
    class func currentLanguage() -> String {
        return UserDefaults.standard.string(forKey: "userLanguage") ?? "en" // Default to English if not set
    }

    // Function to load localized resource path
    class func localizedPath(forResource name: String?, ofType ext: String?) -> String? {
        let currentLanguage = Bundle.currentLanguage()
        
        // Load the resource from the correct `.lproj` folder based on the language code
        if let path = Bundle.main.path(forResource: name, ofType: ext, inDirectory: "\(currentLanguage).lproj") {
            return path
        }
        
        return nil
    }
    
    

}




