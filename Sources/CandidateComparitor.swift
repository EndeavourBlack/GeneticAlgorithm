//
//  CandidateComparitor.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//


class CandidateComparitor {
    static func isOrderedBefore (left: Candidate?, right: Candidate?) -> Bool {
        return left?.calculateFitness() > right?.calculateFitness()
    }
}
