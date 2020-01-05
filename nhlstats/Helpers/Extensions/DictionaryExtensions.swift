//
//  DictionaryExtensions.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-05.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
