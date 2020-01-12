//
//  Team.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-05.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

class Team {
    var id: Int
    var teamInfoLink: String
    var shortName: String
    var teamName: String

    var wins: Int
    var losses: Int
    var goalsPerGame: Double
    var shotsPerGame: Double
    var shootingPctg: Double

    init(json: [String: Any]) {
        self.id = json["id"] as! Int
        self.teamInfoLink = json["link"] as! String
        self.shortName = json["shortName"] as! String
        self.teamName = json["teamName"] as! String
        
        let statsArray = json["stats"] as! [Any]
        let statsDict = statsArray[0] as! [String: Any]
        let statsValue = statsDict["splits"] as! [Any]
        let statsDictElement = statsValue[0] as! [String: Any]
        let statsJson = statsDictElement["stat"] as! [String: Any]
        
        self.wins = statsJson["wins"] as! Int
        self.losses = statsJson["losses"] as! Int
        self.goalsPerGame = statsJson["goalsPerGame"] as! Double
        self.shotsPerGame = statsJson["shotsPerGame"] as! Double
        self.shootingPctg = statsJson["shootingPctg"] as! Double
    }
    
    var fullTeamName: String {
        get {
            return "\(shortName) \(teamName)"
        }
    }
}
