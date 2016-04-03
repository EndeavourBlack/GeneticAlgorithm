//
//  DefaultPopulationModel.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class DefaultPopulationModel : PopulationModel {

    var PopulationSize = 25;
    var Generations = 0;
    var FitnessCutoff = 0.0;
    var PopulationCutoff = 0.25;
    var GenomeLength = 24;
    var GenomeCrossLength = 8;
    var UniformCross = true;
    var MutateChance = 0.02;
    var MutateAmount = 0.5;

    func getPopulationSize () -> Int {
        return PopulationSize;
    }

    func getGenerations () -> Int {
        return Generations;
    }

    func getFitnessCutoff () -> Double {
        return FitnessCutoff;
    }

    func getPopulationCutoff () -> Double {
        return PopulationCutoff;
    }

    func getGenomeLength () -> Int {
        return GenomeLength;
    }

    func getGenomeCrossLength () -> Int {
        return GenomeCrossLength;
    }

    func isUniformCross () -> Bool {
        return UniformCross;
    }

    func getMutateChance () -> Double {
        return MutateChance;
    }

    func getMutateAmount () -> Double {
        return MutateAmount;
    }

}
