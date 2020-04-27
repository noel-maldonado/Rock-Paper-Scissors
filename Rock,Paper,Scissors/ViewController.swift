//
//  ViewController.swift
//  Rock,Paper,Scissors
//
//  Created by Noel Maldonado on 4/26/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    @IBAction func rockPicker(_ sender: Any) {
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.randomValue = randomResult()
        controller.userValue = 1
        present(controller, animated: true, completion: nil)
    }
    
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
/*
 
 Code Only Example
 
 @IBAction func rollTheDice() {

     let controller: DiceViewController
     controller = storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController

     controller.firstValue = randomDiceValue()
     controller.secondValue = randomDiceValue()

     present(controller, animated: true, completion: nil)
 }
 
 
 Code and Segue
 
 class RollViewController: UIViewController {

     /**
     * Randomly generates a Int from 1 to 6
     */
     func randomDiceValue() -> Int {
         // Generate a random Int32 using arc4Random
         let randomValue = 1 + arc4random() % 6

         // Return a more convenient Int, initialized with the random value
         return Int(randomValue)
     }

     @IBAction func rollTheDice() {
         performSegue(withIdentifier: "rollDice", sender: self)
     }
 }
 
 
 Segue only
 
 
 
 
 
 Passing Values
 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

     if segue.identifier == "rollDice" {
         let controller = segue.destination as! DiceViewController

         controller.firstValue = randomDiceValue()
         controller.secondValue = randomDiceValue()
     }
 }
 
 
 
 */
