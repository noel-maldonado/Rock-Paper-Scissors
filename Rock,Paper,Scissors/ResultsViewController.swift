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

    enum Result: Int{
        case tie = 0, PaperCoversRock = 1, RockCrushesScissors = 2, ScissorsCutPaper = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersChoice(self.userValue!, self.randomValue!)
    }
    

    @IBAction func playAgain(_ sender: Any) {
//        let controller: ViewController
//        controller = storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! ViewController
//        present(controller, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    

    func usersChoice(_ user: Int, _ random: Int) {
        //Bool == win or lose
        switch user {
        case let user where user == random:
//            return (1, nil)
            self.resultImage.image = UIImage(named: "itsATie")
            self.resultLabel.text = "It's a Tie!"
        case let user where user < random && random == 2: // Users is Rock and random is paper
//            return (2, false)
            self.resultImage.image = UIImage(named: "PaperCoversRock")
            self.resultLabel.text = "Paper Covers Rock! You Lost! :("
        case let user where user < random && user == 1 && random == 3: // User is Rock and random is Scissors
//            return (2, true)
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
            self.resultLabel.text = "Rock Crushes Scissors! You Won! :)"
        case let user where user > random && user == 2: // User is Paper and Random is Rock
//            return (2, true)
            self.resultImage.image = UIImage(named: "PaperCoversRock")
            self.resultLabel.text = "Paper Covers Rock! You Won! :)"
        case let user where user > random && random == 2: //User is Scissors and Random is Paper
//            return (3, true)
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
            self.resultLabel.text = "Scissors Cut Paper! You Won! :)"
        case let user where user > random && user == 3: //User is Scissors and Random is Rock
//            return (2, false)
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
            self.resultLabel.text = "Rock Crushes Scissors! You Lost! :("
        case let user where user < random && user == 2: //User is paper and random is scissors
//            return (3, false)
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
            self.resultLabel.text = "Scissors Cut Paper! You Lost! :("
        default:
            print("Error")
        }
    }


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
