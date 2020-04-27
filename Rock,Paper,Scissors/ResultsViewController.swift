//
//  ResultsViewController.swift
//  Rock,Paper,Scissors
//
//  Created by Noel Maldonado on 4/26/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    //Result
    var randomValue: Int?
    
    var userValue: Int?
    
    // Rock = 1 paper = 2 scissors = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersChoice(self.userValue!, self.randomValue!)
    }
    

    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    func usersChoice(_ user: Int, _ random: Int) {
        switch user {
        case let user where user == random:
            self.resultImage.image = UIImage(named: "itsATie")
            self.resultLabel.text = "It's a Tie!"
        case let user where user < random && random == 2: // Users is Rock and random is paper
            self.resultImage.image = UIImage(named: "PaperCoversRock")
            self.resultLabel.text = "Paper Covers Rock! You Lost! :("
        case let user where user < random && user == 1 && random == 3: // User is Rock and random is Scissors
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
            self.resultLabel.text = "Rock Crushes Scissors! You Won! :)"
        case let user where user > random && user == 2: // User is Paper and Random is Rock
            self.resultImage.image = UIImage(named: "PaperCoversRock")
            self.resultLabel.text = "Paper Covers Rock! You Won! :)"
        case let user where user > random && random == 2: //User is Scissors and Random is Paper
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
            self.resultLabel.text = "Scissors Cut Paper! You Won! :)"
        case let user where user > random && user == 3: //User is Scissors and Random is Rock
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
            self.resultLabel.text = "Rock Crushes Scissors! You Lost! :("
        case let user where user < random && user == 2: //User is paper and random is scissors
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
            self.resultLabel.text = "Scissors Cut Paper! You Lost! :("
        default:
            print("Error")
        }
    }


}
