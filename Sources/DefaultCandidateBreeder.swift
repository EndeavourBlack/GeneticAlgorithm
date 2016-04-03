//
//  DefaultCandidateBreeder.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class DefaultCandidateBreeder : CandidateBreeder {
    
    func breedCandidates(leftParent: Candidate, rightParent: Candidate, fitnessCalculator: FitnessCalculator) -> Candidate {
        return DefaultCandidate(leftParent: leftParent, rightParent: rightParent, fitnessCalculator: fitnessCalculator)
    }
    
    func createCandidate(model: CandidateModel, fitnessCalculator: FitnessCalculator) -> Candidate {
        return DefaultCandidate(model: model, fitnessCalculator: fitnessCalculator)
    }
    
}