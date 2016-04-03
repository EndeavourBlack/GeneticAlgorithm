//
//  CandidateBreeder.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//


protocol CandidateBreeder {

    /**
    * Return a new instance of a DefaultCandidate.
    * @param model
    * @return
    */
    func createCandidate (model: CandidateModel, fitnessCalculator: FitnessCalculator) -> Candidate

    /**
    * Breed two candidates together to generate a new candidate based on the parent candidate genomes.
    * @param leftParent
    * @param rightParent
    * @return
    */
    func breedCandidates (leftParent: Candidate, rightParent: Candidate, fitnessCalculator: FitnessCalculator) -> Candidate

}
