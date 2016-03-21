//
//  main.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class TestFitnessCalculator : FitnessCalculator {
    
    let solution = [1,5,2,1,6,3,1,7,8,2,5,7,3,8,1,2,5,7,3,8,9,2,4,6]
    
    func calculateFitness(candidate: Candidate) -> Double {
        var sum = -24.0
        var rawGenome = candidate.getGenome().getGenome()
        for var index = 0; index < candidate.getGenome().length; index += 1 {
            let genomeValueAtIndex = rawGenome[index]

            if Double(solution[index]) == (Double(Int(genomeValueAtIndex * 10000))/1000) {
                sum += 1
            }
        
        }
        
        return sum
    }
    
}

func transform(candidate : Candidate) -> [Double] {
    var output : [Double] = [Double]()
    var rawGenome = candidate.getGenome().getGenome()
    for var index = 0; index < candidate.getGenome().length; index += 1 {
        
        let genomeValueAtIndex = rawGenome[index]
        output.append((Double(Int(genomeValueAtIndex * 10000))/1000.0))
        
    }
    return output
}

var population = DefaultPopulation(model: DefaultPopulationModel(), candidateBreeder: DefaultCandidateBreeder(), fitnessCalculator: TestFitnessCalculator())

var itteration = 0

population.evolveUntilFit({ (fittest: Candidate) -> () in
    
        itteration += 1
        print(itteration)
        print(fittest.getFitness())
    
    }) { (fittest) -> () in
        print(
            transform(fittest)
        )
}

