# Swift Genetic Algorithm
A genetic algorithm written in swift, limited to Foundation libraries in the hope of being interoperable with Swift on Linux

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
