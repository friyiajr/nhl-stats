//
//  TeamInfoViewModel.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation
import Alamofire

class TeamInfoViewModel {
    
    private let team: Team
    var rosterViewModel: TeamRosterViewModel!
    
    init(team: Team) {
        self.team = team
    }
    
    /// Constructs the fill name of the team
    var fullName: String {
        get {
            return team.fullTeamName
        }
    }
    
    /// Returns the number of wins in the team
    var winsCountLabel: String {
        get {
            return String(team.wins)
        }
    }
    
    /// Returns the number of losses in the team
    var lossesCountLabel: String {
        get {
            return String(team.losses)
        }
    }
    
    /// Returns the average number of goals per team rouneded to two decimals
    var goalsPerGameLabel: String {
        get {
            return String(format: "%.2f", team.goalsPerGame)
        }
    }
    
    /// Returns the average number of shots per game rounded to two decimals
    var shotsPerGameLabel: String {
        get {
            return String(format: "%.2f", team.shotsPerGame)
        }
    }
    
    /// Returns the average percentage of shots per game rounded to two decimals
    var shootingPercentagePerGameLabel: String {
        get {
            return String(format: "%.2f", team.shootingPctg)
        }
    }
    
    /// Initiates the process of getting the team roster from the NHL API
    func retrieveRoster(
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void
    ) -> Void {
        let rosterUrlString: String =
            "\(NetworkingConstants.API_URL)\(NetworkingConstants.TEAMS_ENDPOINT)\(team.id)\(NetworkingConstants.ROSTER_ENDPOINT)"
        
        guard let rosterUrl = URL(string: rosterUrlString) else {
            onFailure("Could not form URL")
            return
        }
        
        Alamofire
            .request(rosterUrl, method: .get)
            .validate()
            .responseJSON { response in
                self.handleRosterRetrieved(
                    response: response,
                    onSuccess: onSuccess,
                    onFailure: onFailure)
            }
    }
    
    /// Once the roster has been retrieved process the JSON into player objects
    func handleRosterRetrieved(
        response: DataResponse<Any>,
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void
    ) -> Void {
        if !response.result.isSuccess {
            onFailure("Error while fetching teams")
            return
        }

        guard let value = response.result.value as? [String: Any] else {
            onFailure("Malformed Data")
            return
        }
        
        let rosterJsonArray = value["roster"] as! Array<Any>
        var players: [Player] = []
        
        for playerJson in rosterJsonArray {
            players.append(Player(json: playerJson as! [String: Any]))
        }
        
        rosterViewModel = TeamRosterViewModel(roster: players)
        onSuccess()
    }
}
