//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Tere Durán on 14/09/22.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

}
