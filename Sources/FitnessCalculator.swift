//
//  FitnessCalculator.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

protocol FitnessCalculator {

    /**
     * Calculate the fitness of the candidate with respect to it's implementation.
     * This should set DefaultCandidate.fitness to a float between 0.0f and 1.0f
     */
    func calculateFitness (candidate: Candidate) -> Double

}
