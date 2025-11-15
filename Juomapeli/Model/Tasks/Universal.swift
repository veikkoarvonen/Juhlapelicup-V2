//
//  Untitled.swift
//  Juomapeli
//
//  Created by Valeria Rehokainen on 15.11.2025.
//

import UIKit

struct PlayerData {
    var name: String
    var color: UIColor
    var points: Int
    
    init(name: String, color: UIColor, points: Int) {
        self.name = name
        self.color = color
        self.points = points
    }
}

struct Task {
    var template: String
    var pointsToScore: Int
    var baselinePenalty: Int
}

struct TaskStringConverter {
    
    func renderTemplate(_ template: String, values: [String: String]) -> String {
        var result = template
        for (key, value) in values {
            result = result.replacingOccurrences(of: "{\(key)}", with: value)
        }
        return result
    }
    
    func attributedText(for fullText: String, highlight1: String, highlight2: String, color1: UIColor, color2: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Attributes for the highlighted texts
        let highlight1Attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color1,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        let highlight2Attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color2,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
        // Apply attributes to highlight1
        let highlight1Range = (fullText as NSString).range(of: highlight1)
        if highlight1Range.location != NSNotFound {
            attributedString.addAttributes(highlight1Attributes, range: highlight1Range)
        }
        
        // Apply attributes to highlight2
        let highlight2Range = (fullText as NSString).range(of: highlight2)
        if highlight2Range.location != NSNotFound {
            attributedString.addAttributes(highlight2Attributes, range: highlight2Range)
        }
        
        return attributedString
    }

}

struct GameParameters {
    
    func generatePlayerData(players: [String]) -> [PlayerData] {
        var colors = Colors.colors
        colors.shuffle()
        
        var playerData: [PlayerData] = []
        
        for i in 0..<players.count {
            
            var color: UIColor {
                if i >= colors.count {
                    return .yellow
                } else {
                    return colors[i]
                }
            }
            
            let newPlayer = PlayerData(name: players[i], color: color, points: 0)
            playerData.append(newPlayer)
        }
        
        return playerData
        
    }
    
    func generateTaskIndexesForBasicGame(numberOfTasks: Int, currentLanguage: String, hasPlusSubscription: Bool) -> [Int] {
        
        var targetArray: [Task] {
            if currentLanguage == "fi" {
                return BasicGameTasksFI.tasks
            } else {
                return BasicGameTasksEN.tasks
            }
        }
        
        var amountOfTasksToRandomize: Int {
            if !hasPlusSubscription {
                return 30
            } else {
                return targetArray.count
            }
        }
        
        var indexArray = Array(0..<amountOfTasksToRandomize)
        indexArray.shuffle()
        
        var arrayToReturn: [Int] = []
        
        for i in 0..<numberOfTasks {
            arrayToReturn.append(indexArray[i])
        }
        
        return arrayToReturn
        
    }
    
}
