//
//  DefaultCandidate.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class DefaultCandidate : Candidate {
    
    
    var genome : Genome
    
    var model : CandidateModel?
    
    var fitness : Double = 0
    
    var fitnessCalculator : FitnessCalculator
    
    init (model : CandidateModel, fitnessCalculator : FitnessCalculator) {
        
        self.fitnessCalculator = fitnessCalculator
        genome = DefaultGenome(model: model);
        
        setModel(model)
        
    }
    
    init (leftParent: Candidate, rightParent: Candidate, fitnessCalculator : FitnessCalculator) {
        
        self.fitnessCalculator = fitnessCalculator
        
        genome = DefaultGenome(
            leftGenome: leftParent.getGenome(),
            rightGenome: rightParent.getGenome()
        )
        
        if let model = leftParent.getModel() {
            setModel(model)
        }

    }
    
    /**
    * Get the candidate fitness
    * @return
    */
    func getFitness() -> Double {
        return fitness
    }
    
    /**
    * Set the candidate fitness
    * @param fitness
    */
    func setFitness(fitness: Double) -> Double {
        
        if (validateFitness(fitness)) {
            self.fitness = fitness
        }
        
        return self.fitness
        
    }
    
    /**
    * Check if the fitness is less than or equal to 1
    * @param fitness
    * @return
    */
    func validateFitness (fitness: Double) -> Bool {
        
        if fitness <= 1 {
            return true
        }
        else {
            return false
        }
        
    }
    
    /**
    * Get the CandidateModel used by the candidate.
    * @return
    */
    func getModel() -> CandidateModel? {
        return self.model
    }
    
    /**
    * Configure the candidate with an CandidateModel
    * @param model
    */
    func setModel(model: CandidateModel) -> CandidateModel? {
        self.model = model
        return getModel()
    }
    
    /**
    * Get the candidates genome.
    * @return
    */
    func getGenome() -> Genome {
        return genome
    }
    
    func calculateFitness () -> Double {
        setFitness(
            fitnessCalculator.calculateFitness(self)
        )
        
        return fitness
    }
    

}