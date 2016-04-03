//
//  PopulationModel.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

protocol PopulationModel : CandidateModel {

    /**
    * @return Number of genetic candidates to create.
    */
    func getPopulationSize () -> Int
    /**
    * @return Number of generations the population will exist for before execution ends.
    */
    func getGenerations () -> Int
    /**
    * @return Percentage of population to retain per generation.
    */
    func getPopulationCutoff () -> Double

}
