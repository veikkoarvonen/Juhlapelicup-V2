//
//  GameDatatypes.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 30.11.2025.
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

struct GameConfiguration {
    var players: [String]
    var numberOfTasks: Int
    var gameCategory: Int
    var intensityValue: Float
    var penaltyValue: Float
    var countPoints: Bool
    var shorterRound: Bool
    
    init(players: [String], numberOfTasks: Int, gameCategory: Int, intensityValue: Float, penaltyValue: Float, countPoints: Bool, shorterRound: Bool) {
        self.players = players
        self.numberOfTasks = numberOfTasks
        self.gameCategory = gameCategory
        self.intensityValue = intensityValue
        self.penaltyValue = penaltyValue
        self.countPoints = countPoints
        self.shorterRound = shorterRound
    }
}

struct GameParameters {
    var currentTask: Int
    var numberOfTasks: Int
    var playerData: [PlayerData]
    var p1indexes: [Int]
    var p2indexes: [Int]
    var tasksTemplates: [Task]
    
    init(currentTask: Int, numberOfTasks: Int, playerData: [PlayerData], p1indexes: [Int], p2indexes: [Int], tasksTemplates: [Task]) {
        self.currentTask = currentTask
        self.numberOfTasks = numberOfTasks
        self.playerData = playerData
        self.p1indexes = p1indexes
        self.p2indexes = p2indexes
        self.tasksTemplates = tasksTemplates
    }
}
