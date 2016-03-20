//
//  DefaultGenome.swift
//  Core
//
//  Created by Scott Byrns on 3/19/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class DefaultGenome : Genome {
    
    
    var genome : [Double]
    
    var length : Int = 0
    var mutateChance : Double = 0
    var mutateAmount : Double = 0
    var uniformCross : Bool = false
    var genomeCrossLength : Int = 1
    
    var model : GenomeModel
    
    init(model: GenomeModel) {
        self.length = model.getGenomeLength()
        self.genome = [Double](count: self.length, repeatedValue: 0.0)
        self.model = model
        self.setModel(model)
        createGenome()
    }
    
    init(leftGenome : Genome, rightGenome: Genome) {
        self.model = leftGenome.getModel()
        self.genome = [Double](count: self.length, repeatedValue: 0.0)
        self.setModel(model)
        self.genome = breedGenome(leftGenome, rightGenome: rightGenome)
    }
    
    func getGenome() -> [Double] {
        return genome
    }
    
    
    
    func setGenome(genome: [Double]) -> [Double] {
        self.genome = genome;
        return getGenome();
    }
    
    func getModel() -> GenomeModel {
        return model
    }
    
    func setModel(model : GenomeModel) -> Void {

        self.model = model;
        setLength(model.getGenomeLength());
        setMutateAmount(model.getMutateAmount());
        setMutateChance(model.getMutateChance());
        setUniformCross(model.isUniformCross());
        setGenomeCrossLength(model.getGenomeCrossLength());

    }
    
    func getLength () -> Int {
        return length
    }
    
    func setLength (length: Int) -> Int {
        self.length = length
        return length
    }
    
    func getGenomeCrossLength() -> Int {
        return genomeCrossLength
    }
    
    func setGenomeCrossLength(genomeCrossLength: Int) -> Void {
        self.genomeCrossLength = genomeCrossLength;
    }
    
    func getMutateChance() -> Double {
        return mutateChance
    }
    
    func setMutateChance(mutateChance: Double) -> Void {
        self.mutateChance = mutateChance
    }
    
    func getMutateAmount() -> Double {
        return mutateAmount
    }
    
    func setMutateAmount(mutateAmount: Double) -> Void {
        self.mutateAmount = mutateAmount
    }
    
    func isUniformCross() -> Bool {
        return uniformCross
    }
    
    func setUniformCross(uniformCross: Bool) -> Void {
        self.uniformCross = uniformCross
    }
    
    /**
    * Create the genome.
    * @return True if created, false if already created.
    */
    func createGenome () -> Bool {

        genome = [Double](count: self.length, repeatedValue: 0.0)
        for i in 0...self.length - 1 {
            genome[i] = (randomDouble())
        }
        
        return true
        
    }
    
    /**
    * Return value of a gene at a specified index.
    * This will return a random boolean value if the index is out of bounds.
    * @param index
    * @return
    */
    func getValueAt (index: Int) -> Double {
    
        if index > getLength() - 1 {
            return randomDouble()
        }
    
        return self.genome[index]
    }
    
    /**
    * Take two genomes and splice them together to create a unique genome.
    * @param leftGenome
    * @param rightGenome
    * @return
    * @throws GenomeNotCompatibleException
    */
    func breedGenome (leftGenome : Genome, rightGenome: Genome) -> [Double] {
    
        var output : [Double] = [Double](count: getLength(), repeatedValue: 0.0)
        
        let cross : Int = randomInt(
            getGenomeCrossLength()
        )

        var parent : Genome
        
        for var i = 0; i < getLength(); i += genomeCrossLength {
            
            if self.isUniformCross() {
                
                if randomBool() {
                    parent = leftGenome
                }
                else {
                    parent = rightGenome
                }
                
            }
            else {
                
                if i < cross {
                    parent = leftGenome
                }
                else {
                    parent = rightGenome
                }
                
            }
        
            
            for var j = 0; j < genomeCrossLength; j += 1 {
                
                if randomDouble() < getMutateChance() {
                    output[i+j] = randomDouble()
                }
                else {
                    output[i+j] = parent.getValueAt(i+j)
                }
                
            }
        
        }
        
        return output;
        
    }
    
    func randomDouble() -> Double {
        return Double(arc4random()) /  Double(UInt32.max)
    }
    
    func randomInt (limit : Int) -> Int {
        let val : UInt32 = UInt32(limit)
        return Int(arc4random_uniform(val))
    }
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0 ? true: false
    }
    
}