//
//  Player.swift
//  nhlstatsTests
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation
import Nimble
import Quick

class PlayerTest: QuickSpec {
    override func spec() {
        describe("TeamsModelTest Tests") {
            let mockJson: [String: Any] = [
                "person": [
                    "fullName": "John Smith"
                ],
                "jerseyNumber": "11"
            ]

            describe("init") {
                it("should create the team model from JSON documents") {
                    let player: Player = Player(json: mockJson)

                    expect(player.name).to(equal("John Smith"))
                    expect(player.number).to(equal("11"))
                }
            }
        }
    }
}
