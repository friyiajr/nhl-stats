//
//  LoginViewModel.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-05.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    ///
    /// Retrieves a list of all NHL teams and their information from the
    /// NHL API
    ///
    func getAllNhlTeams(
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void
    ) {
        let getTeamsUrlString =
            "\(NetworkingConstants.API_URL)\(NetworkingConstants.TEAMS_ENDPOINT)"

        guard let teamsUrl = URL(string: getTeamsUrlString) else {
            onFailure("Could not form URL")
            return
        }

        Alamofire
            .request(teamsUrl, method: .get)
            .validate()
            .responseJSON { response in
                self.handleLoginResponse(
                    response: response,
                    onSuccess: onSuccess,
                    onFailure: onFailure)
            }
    }
    
    ///
    /// When login is completed, show the user a message if login fails.
    /// If login succeeds then add all team objects to the state
    ///
    func handleLoginResponse(
        response: DataResponse<Any>,
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void
    ) {
        if !response.result.isSuccess {
            onFailure("Error while fetching teams")
            return
        }

        guard let value = response.result.value as? [String: Any] else {
            onFailure("Malformed Data")
            return
        }
        
        initializeTeamObjects(
            teamsResponse: value,
            onSuccess: onSuccess,
            onFailure: onFailure)
    }
    
    ///
    /// Add the stats to the team object JSON
    ///
    func initializeTeamObjects(
        teamsResponse: [String: Any],
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void
    ) {
        let teamsJsonArray = teamsResponse["teams"] as! [Any]
        
        for team in teamsJsonArray {
            let teamJson = team as! [String: Any]
            let teamsLink = teamJson["link"] as! String
            let teamStatsUrlString =
                "\(NetworkingConstants.BASE_URL)\(teamsLink)\(NetworkingConstants.STATS_ENDPOINT)"
            
            guard let teamsUrl = URL(string: teamStatsUrlString) else {
                onFailure("Could not form URL")
                return
            }
            
            Alamofire
                .request(teamsUrl, method: .get)
                .validate()
                .responseJSON { response in
                    self.buildTeamObjectFromResponse(
                        response: response,
                        teamInfoJson: teamJson,
                        onSuccess: onSuccess,
                        onFailure: onFailure,
                        numOfTeams: teamsJsonArray.count)
                }
        }
    }
    
    ///
    /// Build the actual team objexct and adds it to the state
    ///
    func buildTeamObjectFromResponse(
        response: DataResponse<Any>,
        teamInfoJson: [String: Any],
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (String) -> Void,
        numOfTeams: Int
    ) {
        if !response.result.isSuccess {
            onFailure("Error while fetching teams")
            return
        }

        guard let teamStatsJson = response.result.value as? [String: Any] else {
            onFailure("Malformed Data")
            return
        }
        
        var allTeamDataJson = [String: Any]()
        allTeamDataJson.merge(dict: teamStatsJson)
        allTeamDataJson.merge(dict: teamInfoJson)
        
        let team = Team(json: allTeamDataJson)
        State.shared.allTeamsArray.append(team)
        
        if(State.shared.allTeamsArray.count == numOfTeams) {
            State.shared.allTeamsArray =
                State.shared.allTeamsArray
                    .sorted(by: ({ $0.shortName < $1.shortName }))
            onSuccess()
        }
    }
}
