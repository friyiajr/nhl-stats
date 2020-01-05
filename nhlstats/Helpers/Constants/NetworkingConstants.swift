//
//  NetworkingConstants.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-05.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation


class NetworkingConstants {
    static let BASE_URL = "http://statsapi.web.nhl.com/"
    static let API_LINK = "/api/v1"
    
    static let PEOPLE_ENDPOINT = "/people/"
    static let TEAMS_ENDPOINT = "/teams/"
    static let STATS_ENDPOINT = "/stats/"
    
    static let API_URL = "\(BASE_URL)\(API_LINK)"
}
