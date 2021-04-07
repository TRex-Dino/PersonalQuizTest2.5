//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var finalAnimalLabel: UILabel!
    @IBOutlet var finalTextLabel: UILabel!
    
    @IBOutlet var resultsNavigationItem: UINavigationItem!
    
    var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsNavigationItem.hidesBackButton = true
        
        if let result = calculateAnswer() {
            finalAnimalLabel.text = "Вы - \(result.rawValue)"
            finalTextLabel.text = result.definition
        }
    }
    
    private func calculateAnswer() -> AnimalType? {
        let result: AnimalType?
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for answer in answersChoosen {
            switch answer.type {
            case .dog: dog += 1
            case .cat: cat += 1
            case .rabbit: rabbit += 1
            case .turtle: turtle += 1
            }
        }
        
        switch max(dog, cat, rabbit, turtle) {
        case dog: result = .dog
        case cat: result = .cat
        case rabbit: result = .rabbit
        default: result = .turtle
        }
        
        return result
    }
    
}
