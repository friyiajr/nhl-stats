//
//  State.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-05.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

class State {
    static let shared = State()
    
    var allTeamsArray: [Team] = [Team]()
    
    private init() {}
}
