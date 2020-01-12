//
//  TeamsViewModelTest.swift
//  nhlstatsTests
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation
import Quick
import Nimble


class TeamInfoViewModelTest: QuickSpec {
    override func spec() {
        
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
                                    "shootingPctg": Double(0.123),
                                ],
                        ],
                    ],
                ],
            ],
        ]

        
        describe("TeamInfoViewModel Tests") {
            describe("init") {
                let team: Team = Team(json: mockJson)
                let viewModel: TeamInfoViewModel = TeamInfoViewModel(team: team)
                
                it("should return the full name of the team") {
                    expect(viewModel.fullName).to(equal("NY Rangers"))
                }
                
                it("should return the winsCountLabel") {
                    expect(viewModel.winsCountLabel).to(equal("10"))
                }
                
                it("should return the lossesCountLabel") {
                    expect(viewModel.lossesCountLabel).to(equal("5"))
                }
                
                it("should return the goalsPerGameLabel") {
                    expect(viewModel.goalsPerGameLabel).to(equal("1.12"))
                }
                
                it("should return the shotsPerGameLabel") {
                    expect(viewModel.shotsPerGameLabel).to(equal("4.12"))
                }
                
                it("should return the shootingPercentagePerGameLabel") {
                    expect(viewModel.shootingPercentagePerGameLabel).to(equal("0.12"))
                }
            }
        }
    }
}
