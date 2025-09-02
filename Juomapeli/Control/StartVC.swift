//
//  ViewController.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 26.6.2024.
//

import UIKit
import StoreKit

class Start: UIViewController, LanguageReloader {
    
    let languageManager = LanguageManager()
    var startButton = UIButton()
    var figuresImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeApplication()
        setUpUI()
        
    }
    
    private func setUpUI() {
        
        //Background image
        let ukot = UIImageView()
        if languageManager.getSelectedLanguage() == "en" {
            ukot.image = UIImage(named: "theukotenglish")
        } else {
            ukot.image = UIImage(named: "20")
        }
        ukot.contentMode = .scaleAspectFill
        ukot.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ukot)
        figuresImage = ukot
        
        //Background
        let image = UIImageView()
        image.image = UIImage(named: "alkutausta")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        view.sendSubviewToBack(image)
        
        //Layout
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ukot.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ukot.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ukot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ukot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5)
            
        ])
        
        //Start button
        let newStartButton = UIButton()
        let startButtonText = languageManager.localizedString(forKey: "START_GAME")
        newStartButton.setTitle(startButtonText, for: .normal)
        newStartButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        newStartButton.backgroundColor = .white
        newStartButton.setTitleColor(UIColor(named: C.purple), for: .normal)
        startButton = newStartButton
        newStartButton.frame = CGRect(x: 50, y: 200, width: 140, height: 45)
        newStartButton.center.x = view.center.x
        newStartButton.center.y = view.center.y
        newStartButton.layer.cornerRadius = 8
        newStartButton.layer.masksToBounds = true
        view.addSubview(newStartButton)
        
        newStartButton.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
        
        
        
    }
    
    @objc func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "12", sender: self)
    }

    func initializeApplication() {
        IAPManager.shared.start()  // initialize the IAP manager to handle auto renew subscriptions
        languageManager.checkDeviceLocalization()
        languageManager.setDefaultLanguage()
        let userLanguage = languageManager.getSelectedLanguage()
        languageManager.setLanguage(languageIdentifier: userLanguage)
        reloadBackButtonLanguage()
    }

    
//MARK: - Not used in final code, only for testing
    
    func listAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("Font Family: \(family)")
            for font in UIFont.fontNames(forFamilyName: family) {
                print("  Font: \(font)")
            }
        }
    }
    
}


//MARK: - Language delegate functions

extension Start {
    
    func reloadUILanguage() {
        let startButtonText = languageManager.localizedString(forKey: "START_GAME")
        startButton.setTitle(startButtonText, for: .normal)
        if languageManager.getSelectedLanguage() == "en" {
            figuresImage.image = UIImage(named: "theukotenglish")
        } else {
            figuresImage.image = UIImage(named: "20")
        }
        print("Reloading language in Start VC")
    }
    
    func reloadBackButtonLanguage() {
        let backText = languageManager.localizedString(forKey: "BACK")
        self.navigationItem.backBarButtonItem?.title = backText
    }
}

