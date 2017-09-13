//
//  ViewController.swift
//  PrimeNumber
//
//  Created by mikewang on 2017/9/13.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        // take out number string from textfield
        // cover number string to int
        // using check prime get result
        // using result label show result
        guard let inputString = inputTextField.text, let input = Int(inputString) else { return }
        checkPrime(testNumber: input) {
            self.resultLabel.text = $0
            self.resultLabel.isHidden = false
        }
        resultLabel.isHidden = false
        
        inputTextField.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPrime(testNumber:Int) -> String {
        var isPrime = 1 // 1: is Prime; 2: is not Prime; 0: reenter
        
        if testNumber <= 0 {
            isPrime = 0 // reenter
        } else if testNumber == 1 {
            isPrime = 2 // not prime
        } else {
            for i in 2..<testNumber {
                if testNumber % i == 0 {
                    // input number is not prime
                    isPrime = 2
                }
            }
        }
        switch isPrime {
        case 1:
            return "\(testNumber) is prime"
        case 2:
            return "\(testNumber) is not prime"
        default:
            return "reenter"
        }
    }
    
    func checkPrime(testNumber number:Int, withCompletionHandler handler:(String)->()) {
        handler(checkPrime(testNumber: number))
    }

}

