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
    
    func generatePenaltyValue(baseline: Int, penaltySliderValue: Float) -> Int {
        
        let multiplier = (0.09735) * (penaltySliderValue * penaltySliderValue) + (0.15625)
        let amount = multiplier * Float(baseline)
        let finalNumber = amount.rounded()
        return Int(finalNumber)
        
    }
        
        
//MARK: - Player data
    
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
    
    func generatePlayerIndexes(players: [String], numberOfTasks: Int) -> (p1: [Int], p2: [Int]) {
        
        //Generate p1 indexes
        var p1indexes: [Int] = []
        var indexToInsert = 0
        
        for _ in 0..<numberOfTasks {
            if indexToInsert == players.count - 1 {
                p1indexes.append(indexToInsert)
                indexToInsert = 0
            } else {
                p1indexes.append(indexToInsert)
                indexToInsert += 1
            }
        }
        
        p1indexes.shuffle()
        
        var p2indexes: [Int] = []
        
        for i in 0..<numberOfTasks {
            var arrayForRandomP2 = Array(0..<players.count)
            arrayForRandomP2.remove(at: p1indexes[i])
            p2indexes.append(arrayForRandomP2.randomElement() ?? 0)
        }
        
        return (p1: p1indexes, p2: p2indexes)
        
    }
    
    func generatePlayerIndexesForDatemode(players: [String], numberOfTasks: Int) -> (p1: [Int], p2: [Int]) {
        
        guard players.count > 1 else {
            print("Less than 2 players! Cannot start game. (This should never occur)")
            return (p1: [], p2: [])
        }
        
        var p1index = 0
        var p2index = 1
        
        var p1indexes: [Int] = []
        var p2indexes: [Int] = []
        
        for i in 0..<numberOfTasks {
            if p1index >= players.count {
                p1index = 0
                p1indexes.append(p1index)
                p1index += 1
            } else {
                p1indexes.append(p1index)
                p1index += 1
            }
            
            if p2index >= players.count {
                p2index = 0
                p2indexes.append(p2index)
                p2index += 1
            } else {
                p2indexes.append(p2index)
                p2index += 1
            }
            
        }
        
        return (p1: p1indexes, p2: p2indexes)
        
    }
    
//MARK: - Task data
    
    func generateTaskTemplatesForBasicGame(numberOfTasks: Int, language: String, hasPlusSub: Bool) -> [Task] {
        
        var targetTaskArray: [Task] = (language == "fi") ? BasicGameTasksFI.tasks : BasicGameTasksEN.tasks
            
        if !hasPlusSub {
            if targetTaskArray.count > 30 {
                targetTaskArray = Array(targetTaskArray.prefix(30))
            }
        }
        
        targetTaskArray.shuffle()
        
        targetTaskArray = Array(targetTaskArray.prefix(numberOfTasks))
        
        return targetTaskArray
        
    }
    
    func generateTaskTemplatesForDatemode(numberOfTasks: Int, language: String) -> [Task] {
        
        var targetTaskArray: [Task] = (language == "fi") ? DateTasksFI.tasks : DateTasksEN.tasks
        
        targetTaskArray.shuffle()
        targetTaskArray = Array(targetTaskArray.prefix(numberOfTasks))
        
        return targetTaskArray
        
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
