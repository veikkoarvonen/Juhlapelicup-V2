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

struct TeamModeParameters {
    var currentTask: Int
    var numberOfTasks: Int
    var taskTemplates: [Task]
    var teamIndexes: [Int]
    var parametersAreSet: Bool
    var redTeam: Team?
    var blueTeam: Team?
}

struct TeamModeConfiguration {
    var players: [String]
    var numberOfTasks: Int
    var countPoints: Bool
    var shorterRound: Bool
    var teamConfigurationIndexes: [Int]
}

struct Team {
    var name: String
    var players: [String]
    var points: Int
    var color: UIColor
    
    init(name: String, players: [String], points: Int, color: UIColor) {
        self.name = name
        self.players = players
        self.points = points
        self.color = color
    }
}


