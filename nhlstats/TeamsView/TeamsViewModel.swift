//
//  TeamsViewModel.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Alamofire
import Foundation

class TeamsViewModel {
    var teams: [Team] = State.shared.allTeamsArray
    var selectedIndex: Int
    
    init() {
        selectedIndex = -1
    }

    func reloadTeams() {
        teams = State.shared.allTeamsArray
    }
}
