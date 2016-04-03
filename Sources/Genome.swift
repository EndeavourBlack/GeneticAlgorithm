//
//  Chromosome.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

protocol Genome {

    /**
    * Get the boolean[] representation of the genome.
    * @return
    */
    func getGenome() -> [Double]

    /**
    * Set the boolean[] representation fo the genome.
    * @param genome
    * @return
    */
    func setGenome(genome : [Double]) -> [Double]

    /**
    * Get the length of the genome.
    * @return
    */
    var length : Int {get set}
//    func getLength () -> Int
    /**
    * Return value of a gene at a specified index.
    * This will return a random boolean value if the index is out of bounds.
    * @param index
    * @return
    */
    func getValueAt (index : Int) -> Double

    /**
    * Get the GenomeModel of the genome.
    * @return
    */
    func getModel () -> GenomeModel

}
