//
//  GenomeModel.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

protocol GenomeModel {

    /**
    * @return Length of the genome required to express a meaningful representation.
    */
    func getGenomeLength () -> Int

    /**
    * @return Length of a "gene" in the genome to be cut out and added to a child genome.
    */
    func getGenomeCrossLength () -> Int

    /**
    * @return Require a uniform cross, or that genes copied are equally distributed between the parents.
    * If this is false a parent is chosen at random each time.
    */
    func isUniformCross () -> Bool

    /**
    * @return Chance of mutating when cross breeding parents.
    */
    func getMutateChance () -> Double

    /**
    * @return How much mutation may occur.
    */
    func getMutateAmount () -> Double

}
