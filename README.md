# Swift Genetic Algorithm
A genetic algorithm written in swift. Linux compatible.


[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms Linux](https://img.shields.io/badge/Platforms-Linux-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://tldrlegal.com/license/mit-license)


## Ussage

```swift

class TestFitnessCalculator : FitnessCalculator {

    let solution = [1,5,2,1,6,3,1,7,8,2,5,7,3,8,1,2,5,7,3,8,9,2,4,6]

    func calculateFitness(candidate: Candidate) -> Double {
        var sum = -24.0
        var rawGenome = candidate.getGenome().getGenome()
        for var index = 0; index < candidate.getGenome().length; index += 1 {
            let genomeValueAtIndex = rawGenome[index]

            if Double(solution[index]) == (Double(Int(genomeValueAtIndex * 1000))/100) {
                sum += 1
            }

        }

        return sum
    }

}

var population = DefaultPopulation(model: DefaultPopulationModel(), candidateBreeder: DefaultCandidateBreeder(), fitnessCalculator: TestFitnessCalculator())

var itteration = 0

population.evolveUntilFit({ (fittest: Candidate) -> () in

        itteration += 1
        print(itteration)
        print(fittest.getFitness())

    }) { (fittest) -> () in
        print(fittest)
}


```

### Notes
This is a port of an old Java library I wrote and has some relics of java programming patterns in it.
