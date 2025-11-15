//
//  GameVCUI.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 15.11.2025.
//

import UIKit

struct GameVCUI {
    
    let languagemanager = LanguageManager()
    
    func generateBackGroundImage(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIImageView {
        
        let selectedLanguage = languagemanager.getSelectedLanguage()
        
        var backGroundImageString: String {
            if selectedLanguage == "fi" {
                return "raibale_OIKEESTIOIKEESTI"
            } else {
                return "jampartycup_raibale"
            }
        }
        
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: backGroundImageString)
        backgroundImage.frame = CGRect(x: 0.0, y: safeArea.top, width: viewFrame.width, height: viewFrame.height - safeArea.top - safeArea.bottom)
        
        return backgroundImage
        
    }
    
    func generateTaskLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let taskLabel = UILabel()
        taskLabel.text = "Tämä on testikirjoitus. Katsotaan näkyykö tämä ihan sopivasti käyttöliittymässä. Jos ei niin koodaappa lisää"
        taskLabel.font = UIFont.systemFont(ofSize: 18.0)
        taskLabel.textAlignment = .center
        taskLabel.numberOfLines = 0
        taskLabel.textColor = .black
        taskLabel.backgroundColor = .yellow //For testing the frame
        
        let height: CGFloat = 200.0
        let width: CGFloat = viewFrame.width - 100
        let x: CGFloat = 50
        let y: CGFloat = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - (height / 2)
        
        taskLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return taskLabel
        
    }
    
    func generateYesButton(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIImageView {
        
        let yesView = UIImageView()
        yesView.image = UIImage(named: "right")
        
        let size: CGFloat = 60.0
        let x: CGFloat = viewFrame.width - 70.0 - size
        let y: CGFloat = viewFrame.height - safeArea.bottom - 150 - size
        
        yesView.frame = CGRect(x: x, y: y, width: size, height: size)
        
        return yesView
        
    }
    
    func generateNoButton(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIImageView {
        
        let noView = UIImageView()
        noView.image = UIImage(named: "wrong")
        
        let size: CGFloat = 60.0
        let x: CGFloat = 70.0
        let y: CGFloat = viewFrame.height - safeArea.bottom - 150 - size
        
        noView.frame = CGRect(x: x, y: y, width: size, height: size)
        
        return noView
        
    }
    
    func generatePointLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let pointLabel = UILabel()
        pointLabel.text = "0"
        pointLabel.textColor = .white
        pointLabel.textAlignment = .center
        pointLabel.font = UIFont(name: "EricaOne-Regular", size: 50.0)
        pointLabel.backgroundColor = .red
        
        let width: CGFloat = 100
        let height: CGFloat = 50
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = safeArea.top + 25.0
        
        pointLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return pointLabel
        
    }
    
    func generateTimeLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let timeLabel = UILabel()
        timeLabel.text = "0"
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "EricaOne-Regular", size: 35.0)
        timeLabel.backgroundColor = .red
        
        let width: CGFloat = 100
        let height: CGFloat = 50
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = viewFrame.height - 100.0 - height
        
        timeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return timeLabel
        
    }
    
    func generateWordLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIView {
        
        let container = UIView()
        container.backgroundColor = .clear
        
        // Shadow on container (not on label!)
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 5)
        container.layer.shadowRadius = 3
        
        let wordLabel = UILabel()
        wordLabel.text = "Xcode"
        wordLabel.textColor = .black
        wordLabel.textAlignment = .center
        wordLabel.font = UIFont.systemFont(ofSize: 20.0)
        wordLabel.backgroundColor = .white
        
        // Rounded corners + clipping
        wordLabel.layer.cornerRadius = 10
        wordLabel.layer.masksToBounds = true  // IMPORTANT
        
        let height: CGFloat = 350
        let width: CGFloat = 220
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - height / 2
        
        container.frame = CGRect(x: x, y: y, width: width, height: height)
        wordLabel.frame = container.bounds
        
        container.addSubview(wordLabel)
        return container
    }

    
}
