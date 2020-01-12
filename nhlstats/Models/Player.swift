//
//  Player.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

class Player {
    
    var name: String
    var number: String
    
    init(json: [String:Any]) {
        let player = json["person"] as! [String: Any]
        
        self.name = player["fullName"] as! String
        self.number = json["jerseyNumber"] as! String
    }
}
