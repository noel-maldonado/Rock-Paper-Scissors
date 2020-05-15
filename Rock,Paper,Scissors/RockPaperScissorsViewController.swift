//
//  ViewController.swift
//  Rock,Paper,Scissors
//
//  Created by Noel Maldonado on 4/26/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

    var userPickOption: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func randomResult() -> Int {
        //generate a random number 1 - 3 for the three options
        let randomValue = 1 + arc4random() % 3
        return Int(randomValue)
        
    }
    
    //Preseent ResultsViewController through code only
    @IBAction func rockPicker(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let controller = storyBoard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.randomValue = randomResult()
        controller.userValue = 1
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //Preseent ResultsViewController through code and segue only
    @IBAction func paperPick(_ sender: Any) {
        performSegue(withIdentifier: "paperPick", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scissorsPick" {
            let controller = segue.destination as! ResultsViewController
            controller.userValue = 3
            controller.randomValue = randomResult()
        }
        if segue.identifier == "paperPick" {
            let controller = segue.destination as! ResultsViewController
            controller.userValue = 2
            controller.randomValue = randomResult()
        }
    }
}
// Rock - Code        Paper - Code & Segue          scissors - Segue
