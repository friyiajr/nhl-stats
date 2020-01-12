//
//  TeamsModelTest.swift
//  nhlstatsTests
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

import Foundation
import Quick
import Nimble


class TeamsModelTest: QuickSpec {
    override func spec() {
        describe("TeamsModelTest Tests") {
            
            let mockJson: [String: Any] = [
                "id": 1,
                "link": "/api/v1/rangers",
                "shortName": "NY",
                "teamName": "Rangers",
                "stats": [
                    [
                        "splits": [
                            [
                                "stat":
                                [
                                     "wins": Int(10),
                                     "losses": Int(5),
                                     "goalsPerGame": Double(1.123),
                                     "shotsPerGame": Double(4.123),
                                     "shootingPctg": Double(0.123)
                                ]
                            ]
                        ]
                    ]
                ]
            ]
            
            describe("init") {
                it("should create the team model from JSON documents") {

                    let team: Team = Team(json: mockJson)
                    
                    expect(team.id).to(equal(1))
                    expect(team.shortName).to(equal("NY"))
                    expect(team.teamName).to(equal("Rangers"))
                    expect(team.wins).to(equal(10))
                    expect(team.losses).to(equal(5))
                    expect(team.goalsPerGame).to(equal(1.123))
                    expect(team.shotsPerGame).to(equal(4.123))
                    expect(team.shootingPctg).to(equal(0.123))
                       
                }
            }
            
            describe("fullTeamName") {
                it("should return the name of the team") {
                    let team: Team = Team(json: mockJson)
                    expect(team.fullTeamName).to(equal("NY Rangers"))
                }
            }
        }
    }
}
