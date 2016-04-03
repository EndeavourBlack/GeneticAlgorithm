//
//  Candidate.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//


protocol Candidate {

    /**
    * Calculate the fitness of the candidates expression relative to a target.
    */
    func calculateFitness() -> Double

    /**
    * Get the fitness of the candidate.
    * @return
    */
    func getFitness() -> Double

    /**
    * Set the fitness of the candidate.
    * @param fitness
    * @return
    */
    func setFitness(fitness : Double) -> Double

    /**
    * Get the CandidateModel of the candidate.
    * @return the candidate model being used by this candidate.
    */
    func getModel () -> CandidateModel?

    /**
    * Get the Genome of the candidate.
    * @return the candidates genome.
    */
    func getGenome() -> Genome

}
