//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        
        // Create a dictionary
        var frequencyOfAnswers: [Animal: Int] = [:]
        
        // Extract animal types from responses
        let responseTypes = responses.map { $0.animal }
        
        // Fill dictionary and calculate a frequence
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
        ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        resultDefinitionLabel.sizeToFit()
    }
    
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
