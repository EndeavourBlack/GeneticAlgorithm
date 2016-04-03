//
//  Random.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//
#if os(Linux)
    import Glibc
#else
    import Darwin
#endif


class Random {
    static func randomDouble() -> Double {
        #if os(Linux)
            // if Random.randomBool() {
              return (Double(Glibc.random()) /  Double(UInt32.max)) * 2
            // }
            // return Double(Glibc.random()) /  Double(UInt32.max)
        #else
            return Double(arc4random()) /  Double(UInt32.max)
        #endif
    }

    static func randomInt (limit : Int) -> Int {
        let val : Int = limit
        #if os(Linux)
            return Int(Glibc.random() % val + 1)
        #else
            return Int(arc4random_uniform(val))
        #endif
    }

    static func randomBool() -> Bool {
      #if os(Linux)
          return Int(Glibc.random() % 2) == 0 ? true : false
      #else
          return arc4random_uniform(2) == 0 ? true: false
      #endif
    }

}
