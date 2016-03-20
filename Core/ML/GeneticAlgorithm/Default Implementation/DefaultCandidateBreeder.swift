//
//  DefaultCandidateBreeder.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class DefaultCandidateBreeder : CandidateBreeder {
    
    func breedCandidates(leftParent: Candidate?, rightParent: Candidate?, fitnessCalculator: FitnessCalculator) -> Candidate? {
        if let left = leftParent {
            if let right = rightParent {
                
                leftParent?.getModel()?.getGenomeCrossLength()
                
                return DefaultCandidate(leftParent: left, rightParent: right, fitnessCalculator: fitnessCalculator)
                
            }
            else {
                return left
            }
        }
        else if let right = rightParent {
            return right
        }
        
        return nil
    }
    
    func createCandidate(model: CandidateModel, fitnessCalculator: FitnessCalculator) -> Candidate {
        return DefaultCandidate(model: model, fitnessCalculator: fitnessCalculator)
    }
    
}