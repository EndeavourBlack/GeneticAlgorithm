//
//  DefaultPopulation.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation
import Venice

class DefaultPopulation : Population {


    var model : PopulationModel
    var candidatesSorted : Bool = false

    var generations : Int = 0

    var candidates : [Candidate]
    var candidateBreeder : CandidateBreeder
    var fitnessCalculator: FitnessCalculator

    init (model: PopulationModel, candidateBreeder : CandidateBreeder, fitnessCalculator: FitnessCalculator) {
        self.model = model
        self.candidateBreeder = candidateBreeder
        self.fitnessCalculator = fitnessCalculator
        candidates = [Candidate]()
        createPopulation();
    }

    /**
    * Create the population of candidates.
    */
    func createPopulation () -> Void {
        let limit = getModel().getPopulationSize()
        candidates = [Candidate](repeating: getCandidateBreeder().createCandidate(getModel(), fitnessCalculator: fitnessCalculator), count: limit)
    }

    /**
    * Sort the population by its fitness.
    */
    func sortPopulationByFitness () -> Void {
        if isCandidatesSorted() {
            return
        }


        var limit = candidates.count
        let done = Channel<Bool>(bufferSize: 1)
        let step = Channel<Bool>(bufferSize: 1)

        co {
            for index in 0...limit - 1 {
              co {
                self.candidates[index].calculateFitness()
                step <- true
              }
            }

            while (true) {
              select { when in
                  when.receiveFrom(step) { result in
                      limit -= 1
                      if limit == 0 {
                        done <- true
                        return
                      }
                  }
              }
            }
        }

        <-done

        candidates.sort ( isOrderedBefore : {(left : Candidate?, right: Candidate?) -> Bool in
            return CandidateComparitor.isOrderedBefore(left, right: right)
        })

        setCandidatesSorted(true);
    }

    func worker(done: Channel<Bool>, candidate: Candidate) {
      candidate.calculateFitness()
      done <- true // Send a value to notify that we're done.
    }

    /**
    * Create the next generation of the population.
    */
    func nextGeneration () -> Bool {


        sortPopulationByFitness();

        let populationToReserve : Int = (Int)(getModel().getPopulationCutoff() * Double(getModel().getPopulationSize()));

        for i in populationToReserve...getModel().getPopulationSize() - 1 {
          candidates[i] = getCandidateBreeder().breedCandidates(
              candidates[(Int)(Random.randomDouble() * Double(populationToReserve))],
              rightParent: candidates[(Int)(Random.randomDouble() * Double(populationToReserve))],
              fitnessCalculator: fitnessCalculator
          );
        }

        setCandidatesSorted(false);

        generations += 1

        if (getModel().getFitnessCutoff() <= getFittest().getFitness()) {
            return false
        }

        return true
    }

    /**
    * Sort the candidates by fitness and return the fittest of them.
    * @return The fittest candidate
    */
    func getFittest () -> Candidate {
        sortPopulationByFitness()
        return candidates[0]
    }

    /**
    * Randomly sort our population.
    */
    func randomSortCandidates () -> Void {

        candidates.sort(isOrderedBefore: { (left: Candidate?, right: Candidate?) -> Bool in
            return Random.randomBool()
        })

    }

    func evolveUntilFit(currentGeneration: (fittest: Candidate) -> (), when evolutionIsCompleted: (fittest: Candidate) -> ()) {
        var isCutOff : Bool = false
        while(!isCutOff) {
            isCutOff = !self.nextGeneration();
            currentGeneration(fittest: self.getFittest())
            if getModel().getGenerations() > 0 && generations == getModel().getGenerations() {
                print("Generation cutoff met")
                isCutOff = true
            }
        }

        evolutionIsCompleted(fittest: self.getFittest())

    }


    func getModel() -> PopulationModel {
        return model
    }

    func setModel(model: PopulationModel) -> Void {
        self.model = model
    }

    func getCandidates() -> [Candidate] {
        return candidates
    }

    func setCandidates(defaultCandidates : [Candidate]) -> Void {
        self.candidates = defaultCandidates;
    }

    func getCandidateBreeder() -> CandidateBreeder {
        return candidateBreeder
    }

    func setCandidateBreeder(candidateBreeder: CandidateBreeder) -> Void {
        self.candidateBreeder = candidateBreeder
    }

    func isCandidatesSorted() -> Bool {
        return candidatesSorted
    }

    func setCandidatesSorted(candidatesSorted : Bool) -> Void {
        self.candidatesSorted = candidatesSorted
    }

}
