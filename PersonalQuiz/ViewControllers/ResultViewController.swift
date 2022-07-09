//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    var questions:  [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        animalDefinitionLabel.numberOfLines = 0
        
        showResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func showResult() {
        guard answersChosen.first != nil else { return }
        
        let animal = getMostPopularAnimal(from: answersChosen)
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        
        animalDefinitionLabel.text = animal.definition
    }
    
    private func getMostPopularAnimal(from answersChosen: [Answer]) -> Animal {
        var animalsAnswersCount = [answersChosen.first!.animal: 0]
        
        for answer in answersChosen {
            if animalsAnswersCount[answer.animal] == nil {
                animalsAnswersCount[answer.animal] = 1
            } else {
                animalsAnswersCount[answer.animal]! += 1
            }
        }
        
        let sortedAnimals = animalsAnswersCount.sorted(by: { $0.value > $1.value } )
        return sortedAnimals.first!.key
    }
}
