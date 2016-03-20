//
//  CandidateModel.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol CandidateModel : GenomeModel {
    
    /**
    * @return Target fitness cutoff. If the fitness of a candidate is equal to or greater than this value
    * an OptimizationCutoffException exception will be thrown.
    */
    func getFitnessCutoff () -> Double
    
}