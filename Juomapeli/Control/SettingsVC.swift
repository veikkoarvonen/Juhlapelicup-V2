//
//  Settings.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 25.7.2024.
//

import UIKit
import StoreKit

class SettingsView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let languageManager = LanguageManager()
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setUpActivityIndicator()
        
    }
    
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: C.purple)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switch section {
        case 0: label.text = languageManager.localizedString(forKey: "ABOUT_HEADER")
        case 1: label.text = languageManager.localizedString(forKey: "RESPONSIBLE_PLAYING_HEADER")
        case 2: label.text = languageManager.localizedString(forKey: "PLUS_SUBSCRIPTION_HEADER")
        case 3: label.text = languageManager.localizedString(forKey: "LANGUAGE_HEADER")
        default: label.text = languageManager.localizedString(forKey: "ABOUT_HEADER")
        }
        
        label.font = UIFont(name: "Marker Felt", size: 18)
        label.textColor = .white
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 2
        case 2: return 1
        case 3: return 2
        default: return 0
        }
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "HOME_PAGE_LINK")
                } else if indexPath.row == 1 {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "PRIVACY_POLICY_LINK")
                } else {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "TERMS_OF_USER_LINK")
                }
            } else if indexPath.section == 1 {
                if indexPath.row == 0 {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "RESPONSIBLE_PLAYING_DESCRIPTION")
                } else {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "LEARN_MORE_LINK")
                }
            } else if indexPath.section == 2 {
                cell.textLabel?.text = languageManager.localizedString(forKey: "RESTORE_PURCHASES")
            } else {
                if indexPath.row == 0 {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "FINNISH_LANGUAGE")
                } else {
                    cell.textLabel?.text = languageManager.localizedString(forKey: "ENGLISH_LANGUAGE")
                }
            }
            
            cell.textLabel?.numberOfLines = 0
            if indexPath.section == 1 && indexPath.row == 0 {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .disclosureIndicator
            }
            
            return cell
        }
        
// MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Handle cell selection
            tableView.deselectRow(at: indexPath, animated: true)
            
            let links = [
                "https://veikkoarvonen.github.io/juhlapeliWebsite/",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/tietosuoja.html",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/kauttoehdot.html",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/vastuullisuus.html"
            ]
            
            let englishLinks = [
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/homeEnglish.html",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/privacyPolicy.html",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/termsOfUse.html",
                "https://veikkoarvonen.github.io/juhlapeliWebsite/HTML/responsivePlaying.html"
            ]
       
//MARK: - Section 0
            var destinationArray: [String] = []
            if languageManager.getSelectedLanguage() == "en" {
                destinationArray = englishLinks
            } else {
                destinationArray = links
            }
            
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    print("Perussivu")
                    openURL(link: destinationArray[0])
                } else if indexPath.row == 1 {
                    print("Tietosuoja")
                    openURL(link: destinationArray[1])
                } else if indexPath.row == 2 {
                    print("Käyttöehdot")
                    openURL(link: destinationArray[2])
                }

//MARK: - Section 1
                
            } else if indexPath.section == 1 {
                if indexPath.row == 1 {
                    print("Vastuullisuus")
                    openURL(link: links[3])
                }
                
//MARK: - Section 2
                
            } else if indexPath.section == 2 {
                if indexPath.row == 0 {
                    print("Restore button tapped")
                    if !IAPManager.shared.isSubscriptionActive() {
                        func restoreCallBackListener(response: purchaseResponse?, error: String?) {
                            print("restore call back ", response ?? "No Response")
                            if let error = error {
                                print("Error Occured during restore : ", error)
                                showAlert(alertText: "Error while restoring : \(error)")
                            } else if let response = response {
                                print("Restore success and product id is : ", response.productId, response.expiry)
                                showAlert(alertText: "Subscription restored : \(response.productId). Expiry at \(response.expiry)")
                            }
                            stopLoading()
                        }
                        startLoading()
                        IAPManager.shared.restore(callback: restoreCallBackListener)
                    }else{
                        // Create an alert controller
                        let alert = UIAlertController(title: "Alert",
                                                      message: "You already have an active subscription.",
                                                      preferredStyle: .alert)
                        
                        // Add an action (button) to dismiss the alert
                        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                            print("OK button tapped")
                        }
                        alert.addAction(okAction)
                        
                        // Present the alert
                        present(alert, animated: true, completion: nil)
                    }
                }
                
//MARK: - Section 3
                
            } else if indexPath.section == 3 {
                if indexPath.row == 0 {
                    print("Suomi")
                    changeAppLanguage(identifier: "fi")
                } else if indexPath.row == 1 {
                    print("English")
                    changeAppLanguage(identifier: "en")
                }
            }
            
            
        }
    
    
    func openURL(link: String) {
        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Invalid URL or cannot be opened")
        }

    }
    
    func showAlert(alertText: String) {
        // Create an alert controller
        let alert = UIAlertController(title: "Alert",
                                      message: alertText,
                                      preferredStyle: .alert)
        
        // Add an action (button) to dismiss the alert
        let okAction = UIAlertAction(title: "Selvä", style: .default) { _ in
            print("OK button tapped")
        }
        alert.addAction(okAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    func startLoading() {
        activityIndicator.startAnimating()  // Start the spinner animation
        view.isUserInteractionEnabled = false  // Disable user interaction while loading
    }
    
    // Stop the spinner when done
    func stopLoading() {
        activityIndicator.stopAnimating()  // Stop the spinner animation
        view.isUserInteractionEnabled = true  // Re-enable user interaction after loading
    }
    
    private func setUpActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)  // You can choose .medium or .large
        activityIndicator.center = view.center  // Center the spinner on the screen
        view.addSubview(activityIndicator)  // Add it to the view hierarchy

        // Optionally, set a color
        activityIndicator.color = .black
    }
    
    
    func changeAppLanguage(identifier: String) {
        startLoading()
        //Bundle changes here
        languageManager.setLanguage(languageIdentifier: identifier)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            self.stopLoading()
            self.reloadNavigationStack()
            self.navigationController?.popViewController(animated: true)
            //self.navigationController?.popToRootViewController(animated: true)
            print(languageManager.localizedString(forKey: "START_GAME"))
            //self.printCurrentBundle()
            //tableView.reloadData()
        }
        
    }
    
    
    
    func printCurrentBundle() {
        let currentLanguage = Bundle.currentLanguage() // Get the current language from UserDefaults
        let bundlePath = Bundle.main.bundlePath + "/\(currentLanguage).lproj"
        print("Current bundle path: \(bundlePath)")
        
    }
    
    func printDemoStringFromCurrentbundle() {
        print("Start game text from current bundle: \(NSLocalizedString("START_GAME", comment: "Start game string"))")
    }
    
    func reloadUILanguage() {
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func reloadNavigationStack() {
        guard let viewControllers = self.navigationController?.viewControllers else { return }

        for controller in viewControllers {
            if let reloadableController = controller as? LanguageReloader {
                reloadableController.reloadUILanguage()
                reloadableController.reloadBackButtonLanguage()
            }
        }
        
        
        
    }


    

}
