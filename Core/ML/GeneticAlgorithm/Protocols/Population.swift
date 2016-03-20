//
//  Population.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol Population {
    
    /**
    * Create the next generation of the population.
    */
    func nextGeneration () -> Bool
    /**
    * Sort the candidates by fitness and return the fittest of them.
    * @return The fittest candidate
    */
    func getFittest () -> Candidate
    /**
    * Randomly sort our population.
    */
    func randomSortCandidates () -> Void
    
    func getModel() -> PopulationModel
    
    func evolveUntilFit (currentGeneration: ([Candidate]) -> (), when evolutionIsCompleted: (fittest: Candidate) -> ()) -> Void
    
}