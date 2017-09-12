//
//  ViewController.swift
//  WhatTheNumber
//
//  Created by mikewang on 2017/9/12.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Make a random number
    var answer = Int(arc4random_uniform(100) + 1)
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false {
            // playing game
            print("answer = \(answer)")
            let inputText = inputTextField.text!
            
            // clear textfield
            inputTextField.text = ""
            
            // take input text out
            let inputNumber = Int(inputText)
            print("inputNumber = \(inputNumber)")
            
            if inputNumber == nil {
                // no input
                messageLabel.text = "No input! Guess a number between \(minNumber) ~ \(maxNumber)"
            } else {
                // go input
                if inputNumber! > maxNumber {
                    // user input too large
                    messageLabel.text = "Too large! Guess a number between \(minNumber) ~ \(maxNumber)"
                } else if inputNumber! < 1 {
                    // user input too small
                    messageLabel.text = "Too small! Guess a number between \(minNumber) ~ \(maxNumber)"
                } else {
                    // check answer
                    if inputNumber == answer {
                        // Bingo! right answer!
                        messageLabel.text = "You are right. Press [Guess] to play again."
                        isOver = true
                    } else {
                        // Wrong answer
                        if inputNumber! > answer {
                            // lager than answer
                            maxNumber = inputNumber!
                        } else {
                            // smaller than answer
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "Try Again! Guess a number between \(minNumber) ~ \(maxNumber)"
                    }
                }
            }
        } else {
            // game is over
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Push the keyboard up
        inputTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

