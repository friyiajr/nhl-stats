//
//  TeamInfoViewModel.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

class TeamInfoViewModel {
    
    private let team: Team
    
    init(team: Team) {
        self.team = team
    }
    
    var fullName: String {
        get {
            return team.fullTeamName
        }
    }
    
    var winsCountLabel: String {
        get {
            return String(team.wins)
        }
    }
    
    var lossesCountLabel: String {
        get {
            return String(team.losses)
        }
    }
    
    var goalsPerGameLabel: String {
        get {
            return String(format: "%.2f", team.goalsPerGame)
        }
    }
    
    var shotsPerGameLabel: String {
        get {
            return String(format: "%.2f", team.shotsPerGame)
        }
    }
    
    var shootingPercentagePerGameLabel: String {
        get {
            return String(format: "%.2f", team.shootingPctg)
        }
    }
}
