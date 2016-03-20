//
//  Random.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation


class Random {
    static func randomDouble() -> Double {
        return Double(arc4random()) /  Double(UInt32.max)
    }
    
    static func randomInt (limit : Int) -> Int {
        let val : UInt32 = UInt32(limit)
        return Int(arc4random_uniform(val))
    }
    
    static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0 ? true: false
    }
}