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
        
        let height: CGFloat = 300.0
        let width: CGFloat = viewFrame.width - 150
        let x: CGFloat = 75
        let y: CGFloat = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - (height / 2)
        
        taskLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        
        if C.testUIWithColors { taskLabel.backgroundColor = .yellow }
        
        return taskLabel
        
    }
    
    func generateYesButton(viewFrame: CGRect, safeArea: UIEdgeInsets) -> PointButtonComponents {
        
        let yesView = UIImageView()
        yesView.image = UIImage(named: "points-right")
        
        let width: CGFloat = 115.0
        let heigth: CGFloat = 60.0
        let x: CGFloat = 50.0
        let y: CGFloat = viewFrame.height - safeArea.bottom - 70 - heigth
        
        yesView.frame = CGRect(x: x, y: y, width: width, height: heigth)
        
        if C.testUIWithColors { yesView.backgroundColor = .green }
        
        let label = UILabel()
        label.text = "+3"
        label.font = UIFont(name: "Optima-Bold", size: 17.0)
        label.textAlignment = .center
        label.textColor = .black
        
        label.frame = CGRect(x: 55.0, y: 0.0, width: 50.0, height: 60.0)
        
        yesView.addSubview(label)
        
        return PointButtonComponents(container: yesView, label: label)
        
    }
    
    func generateNoButton(viewFrame: CGRect, safeArea: UIEdgeInsets) -> PointButtonComponents {
        
        let noView = UIImageView()
        noView.image = UIImage(named: "points-wrong")
        
        let width: CGFloat = 115.0
        let heigth: CGFloat = 60.0
        let x: CGFloat = viewFrame.width - 50.0 - width
        let y: CGFloat = viewFrame.height - safeArea.bottom - 50 - heigth
        
        noView.frame = CGRect(x: x, y: y, width: width, height: heigth)
        
        if C.testUIWithColors { noView.backgroundColor = .green }
        
        let label = UILabel()
        label.text = "+3"
        label.font = UIFont(name: "Optima-Bold", size: 17.0)
        label.textAlignment = .center
        label.textColor = .black
        
        label.frame = CGRect(x: 10.0, y: 0.0, width: 50.0, height: 60.0)
        
        noView.addSubview(label)
        
        return PointButtonComponents(container: noView, label: label)
        
    }
    
    func generatePointLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let pointLabel = UILabel()
        pointLabel.numberOfLines = 0
        pointLabel.text = "Suorittiko Veikko tehtävän?"
        pointLabel.textColor = .white
        pointLabel.textAlignment = .center
        pointLabel.font = UIFont(name: "EricaOne-Regular", size: 20.0)
        pointLabel.backgroundColor = .red
        
        let width: CGFloat = viewFrame.width - 100.0
        let height: CGFloat = 80
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = viewFrame.height - safeArea.bottom - height - 50.0 - 80.0
        
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
    
    func generateWordLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> WordLabelComponents {
        
        let container = UIView()
        container.backgroundColor = .clear
        
        let height: CGFloat = 350
        let width: CGFloat = 220
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - height / 2
        
        container.frame = CGRect(x: x, y: y, width: width, height: height)
        
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
        
        
        
        container.addSubview(wordLabel)
        
        wordLabel.frame = container.bounds
        
      
        return WordLabelComponents(container: container, label: wordLabel)
    }

    
}

struct WordLabelComponents {
    let container: UIView
    let label: UILabel
}

struct PointButtonComponents {
    let container: UIImageView
    let label: UILabel
}

struct GameVCUIElements {
    var backGroundImage = UIImageView()
    var taskLabel = UILabel()
    var yesView: PointButtonComponents?
    var noView: PointButtonComponents?
    var pointLabel = UILabel()
    
    init(backGroundImage: UIImageView = UIImageView(), taskLabel: UILabel = UILabel(), yesView: PointButtonComponents? = nil, noView: PointButtonComponents? = nil, pointLabel: UILabel = UILabel()) {
        self.backGroundImage = backGroundImage
        self.taskLabel = taskLabel
        self.yesView = yesView
        self.noView = noView
        self.pointLabel = pointLabel
    }
}
