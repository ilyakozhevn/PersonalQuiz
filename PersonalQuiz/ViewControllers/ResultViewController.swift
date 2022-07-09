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
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        animalDefinitionLabel.numberOfLines = 0

        showResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any?) {
        navigationController?.dismiss(animated: true)
    }
    
    private func showResult() {
        guard let animal = getMostChosenAnimal() else { return }
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        animalDefinitionLabel.text = animal.definition
    }
    
    private func getMostChosenAnimal() -> Animal? {
        var animalsCounter = [answersChosen.first?.animal: 0]
        
        for answer in answersChosen {
            if animalsCounter[answer.animal] == nil {
                animalsCounter[answer.animal] = 1
            } else {
                animalsCounter[answer.animal]! += 1
            }
        }
        
        let sortedAnimals = animalsCounter.sorted(by: { $0.value > $1.value } )
        
        return sortedAnimals.first?.key
    }
}
