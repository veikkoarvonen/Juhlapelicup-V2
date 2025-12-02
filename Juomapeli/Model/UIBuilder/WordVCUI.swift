//
//  WordVCUI.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 2.12.2025.
//

import UIKit

struct WordVCUI {
    
    func generateBackGroundImage(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UIImageView {
        
        let languagemanager = LanguageManager()
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
    
    func generateInstructionLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let taskLabel = UILabel()
        taskLabel.text = ""
        taskLabel.font = UIFont.systemFont(ofSize: 18.0)
        taskLabel.textAlignment = .center
        taskLabel.numberOfLines = 0
        taskLabel.textColor = .black
        if C.testUIWithColors {taskLabel.backgroundColor = .yellow  }
            
            
            let height: CGFloat = 300.0
            let width: CGFloat = viewFrame.width - 150
            let x: CGFloat = 75
            let y: CGFloat = (viewFrame.height - safeArea.top - safeArea.bottom) / 2 + safeArea.top - (height / 2)
            
            taskLabel.frame = CGRect(x: x, y: y, width: width, height: height)
            
            if C.testUIWithColors { taskLabel.backgroundColor = .yellow }
            
            return taskLabel
            
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
    
    func generateTimeLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let timeLabel = UILabel()
        timeLabel.text = "0"
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "EricaOne-Regular", size: 35.0)
        timeLabel.shadowColor = UIColor.black
        timeLabel.shadowOffset = CGSize(width: 2, height: 2)

        
        let width: CGFloat = 100
        let height: CGFloat = 50
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = viewFrame.height - 100.0 - height
        
        timeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        if C.testUIWithColors { timeLabel.backgroundColor = .red }
        
        return timeLabel
        
    }
    
    func generatePointLabel(viewFrame: CGRect, safeArea: UIEdgeInsets) -> UILabel {
        
        let pointLabel = UILabel()
        pointLabel.numberOfLines = 0
        pointLabel.text = "Pisteet: 0"
        pointLabel.textColor = .white
        pointLabel.textAlignment = .center
        pointLabel.font = UIFont(name: "EricaOne-Regular", size: 35.0)
        pointLabel.shadowColor = UIColor.black
        pointLabel.shadowOffset = CGSize(width: 2, height: 2)
        if C.testUIWithColors { pointLabel.backgroundColor = .red }
        
        
        let width: CGFloat = viewFrame.width - 100.0
        let height: CGFloat = 50
        let x: CGFloat = viewFrame.width / 2 - width / 2
        let y: CGFloat = safeArea.top + 20.0
        
        pointLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return pointLabel
        
    }
    
    func generateColorViews(viewFrame : CGRect) -> (red: UIView, green: UIView) {
        let rightView = UIView()
        rightView.backgroundColor = .green
        rightView.alpha = 0.0
        let rwx: CGFloat = viewFrame.width * 0.75
        let rww: CGFloat = viewFrame.width * 0.25
        rightView.frame = CGRect(x: rwx, y: 0, width: rww , height: viewFrame.height)
        
        let leftView = UIView()
        leftView.backgroundColor = .red
        leftView.alpha = 0.0
        leftView.frame = CGRect(x: 0, y: 0, width: rww , height: viewFrame.height)
        
        return (red: leftView, green: rightView)
    }
    
}

struct WordVCUIElements {
    var backGroundImage = UIImageView()
    var instructionLabel = UILabel()
    var wordContainer: WordLabelComponents?
    var timeLabel = UILabel()
    var pointLabel = UILabel()
    var timeLabelOriginY: CGFloat
    
    init(backGroundImage: UIImageView = UIImageView(), instructionLabel: UILabel = UILabel(), wordContainer: WordLabelComponents? = nil, timeLabel: UILabel = UILabel(), pointLabel: UILabel = UILabel(), timeLabelOriginY: CGFloat) {
        self.backGroundImage = backGroundImage
        self.instructionLabel = instructionLabel
        self.wordContainer = wordContainer
        self.timeLabel = timeLabel
        self.pointLabel = pointLabel
        self.timeLabelOriginY = timeLabelOriginY
    }
}

struct WordLabelComponents {
    let container: UIView
    let label: UILabel
}

struct WordGameParameters {
    var gameTime: Int
    var currentTime: Int
    var wordList: [String]
    var timer: Timer?
    var points: Int
    var currentWord: Int
}
