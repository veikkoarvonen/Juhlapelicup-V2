//
//  GameSelectVCUI.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 15.11.2025.
//

import UIKit

struct GameSelectVCUI {
    
    func generateSettingsButtonView(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIView {
        
        // --- Container Circle ---
        let size: CGFloat = 80
        let container = UIView()
        
        container.frame = CGRect(
            x: viewFrame.width - size - 20,
            y: viewFrame.height - safeArea.bottom - 20 - size,
            width: size,
            height: size
        )
        
        container.backgroundColor = UIColor.white
        container.layer.cornerRadius = size / 2
        container.layer.masksToBounds = false
        
        // Optional: subtle shadow
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        container.layer.shadowRadius = 4
        
        // Enable interaction for tap gestures
        container.isUserInteractionEnabled = true
        
        // --- Inner Emoji Label ---
        let label = UILabel()
        label.text = "⛭"
        label.font = UIFont.systemFont(ofSize: 80) // slightly smaller so it fits inside
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        
        // Center label inside container
        label.frame = container.bounds
        container.addSubview(label)
        
        return container
    }
    
    func generateSettingsView(viewFrame: CGRect, safeArea: UIEdgeInsets) -> SettingsViewComponents {
            
        let testWithBackgroundColors = false
        let languageManager = LanguageManager()
        
        // --- Main container ---
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = false
        
        // Shadow
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.20
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
        container.layer.shadowRadius = 12
        container.layer.borderWidth = 3.0
        container.layer.borderColor = CGColor(red: 151, green: 71, blue: 255, alpha: 1.0)
        
        container.isUserInteractionEnabled = true
        
        // Position it centered on screen
        let containerWidth: CGFloat = viewFrame.width - 50
        let containerHeight: CGFloat = 380
        let y = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - containerHeight / 2 + viewFrame.height
        
        container.frame = CGRect(x: 25, y: y, width: containerWidth, height: containerHeight)
        
        
        // --- Inner margin ---
        let margin: CGFloat = 20
        let elementGap: CGFloat = 10
        let crossButtonSize: CGFloat = 40
        let switchWidth: CGFloat = 70.0
        let headerHeigth: CGFloat = 30
        let headerWidth = containerWidth - margin * 2 - switchWidth
        let descHeigth: CGFloat = (containerHeight - margin * 2 - elementGap * 4 - crossButtonSize - headerHeigth * 2) / 2
        let descWidth = containerWidth - margin * 2
        
        
        // ==========================================================
        // 1. CLOSE BUTTON (X)
        // ==========================================================
        let crossButtonLabel = UILabel()
        crossButtonLabel.text = "✖️"
        crossButtonLabel.font = UIFont.systemFont(ofSize: 28)
        crossButtonLabel.textColor = UIColor.black.withAlphaComponent(0.40)
        crossButtonLabel.textAlignment = .right
        if testWithBackgroundColors { crossButtonLabel.backgroundColor = .green }
        crossButtonLabel.frame = CGRect(
            x: containerWidth - margin - crossButtonSize,
            y: margin,
            width: crossButtonSize,
            height: crossButtonSize
        )
        crossButtonLabel.isUserInteractionEnabled = true
        container.addSubview(crossButtonLabel)
        
        
        // ==========================================================
        // 2. POINTS HEADER
        // ==========================================================
        let pointHeaderLabel = UILabel()
        pointHeaderLabel.text = languageManager.localizedString(forKey: "POINTS_HEADER")
        pointHeaderLabel.font = UIFont(name: "Verdana-Bold", size: 22)
        pointHeaderLabel.textColor = .black
        if testWithBackgroundColors { pointHeaderLabel.backgroundColor = .red }
        pointHeaderLabel.frame = CGRect(
            x: margin,
            y: crossButtonLabel.frame.maxY + elementGap,
            width: headerWidth,
            height: headerHeigth
        )
        container.addSubview(pointHeaderLabel)
        
        
        // DESCRIPTION
        let pointDescLabel = UILabel()
        pointDescLabel.text = languageManager.localizedString(forKey: "POINTS_DESCRIPTION")
        pointDescLabel.font = UIFont.systemFont(ofSize: 16)
        pointDescLabel.textColor = .darkGray
        pointDescLabel.numberOfLines = 0
        if testWithBackgroundColors { pointDescLabel.backgroundColor = .yellow }
        pointDescLabel.frame = CGRect(
            x: margin,
            y: pointHeaderLabel.frame.maxY + elementGap,
            width: descWidth,
            height: descHeigth
        )
        container.addSubview(pointDescLabel)
        
        
        // SWITCH
        let pointSwitch = UISwitch()
        pointSwitch.onTintColor = UIColor(named: C.purple)
        pointSwitch.frame = CGRect(
            x: containerWidth - margin - pointSwitch.frame.width,
            y: pointHeaderLabel.frame.minY,
            width: switchWidth,
            height: pointSwitch.frame.height
        )
        container.addSubview(pointSwitch)
        
        
        // ==========================================================
        // 3. LENGTH HEADER
        // ==========================================================
        let lengthHeaderLabel = UILabel()
        lengthHeaderLabel.text = languageManager.localizedString(forKey: "LENGTH_HEADER")
        lengthHeaderLabel.font = UIFont(name: "Verdana-Bold", size: 22)
        lengthHeaderLabel.textColor = .black
        if testWithBackgroundColors { lengthHeaderLabel.backgroundColor = .red }
        lengthHeaderLabel.frame = CGRect(
            x: margin,
            y: pointDescLabel.frame.maxY + elementGap,
            width: headerWidth,
            height: headerHeigth
        )
        container.addSubview(lengthHeaderLabel)
        
        
        // DESCRIPTION
        let lengthDescLabel = UILabel()
        lengthDescLabel.text = languageManager.localizedString(forKey: "LENGTH_DESCRIPTION")
        lengthDescLabel.font = UIFont.systemFont(ofSize: 16)
        lengthDescLabel.textColor = .darkGray
        lengthDescLabel.numberOfLines = 0
        if testWithBackgroundColors { lengthDescLabel.backgroundColor = .yellow }
        lengthDescLabel.frame = CGRect(
            x: margin,
            y: lengthHeaderLabel.frame.maxY + elementGap,
            width: descWidth,
            height: descHeigth
        )
        container.addSubview(lengthDescLabel)
        
        
        // SWITCH
        let lengthSwitch = UISwitch()
        lengthSwitch.onTintColor = UIColor(named: C.purple)
        lengthSwitch.frame = CGRect(
            x: containerWidth - margin - lengthSwitch.frame.width,
            y: lengthHeaderLabel.frame.minY,
            width: switchWidth,
            height: lengthSwitch.frame.height
        )
        container.addSubview(lengthSwitch)
        
        
        return SettingsViewComponents(
                container: container,
                crossLabel: crossButtonLabel,
                pointHeaderLabel: pointHeaderLabel,
                pointDescLabel: pointDescLabel,
                pointSwitch: pointSwitch,
                lengthHeaderLabel: lengthHeaderLabel,
                lengthDescLabel: lengthDescLabel,
                lengthSwitch: lengthSwitch
            )
    }

    
}

struct SettingsViewComponents {
    let container: UIView
    let crossLabel: UILabel
    let pointHeaderLabel: UILabel
    let pointDescLabel: UILabel
    let pointSwitch: UISwitch
    let lengthHeaderLabel: UILabel
    let lengthDescLabel: UILabel
    let lengthSwitch: UISwitch
}

