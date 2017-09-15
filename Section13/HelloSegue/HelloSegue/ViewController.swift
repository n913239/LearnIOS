//
//  ViewController.swift
//  HelloSegue
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LightRedViewControllerDelegate {

    func setColor(colorType: String) {
        if colorType == "red" {
            view.backgroundColor = UIColor.red
        } else if colorType == "green" {
            view.backgroundColor = UIColor.green
        } else if colorType == "blue" {
            view.backgroundColor = UIColor.blue
        }
    }
    
    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func changeView(_ sender: UIButton) {
        // check if user input text or not
        if let inputText = myTextInput.text {
            if inputText == "" {
                // no input, pop up an alert
                let myAlert = UIAlertController(title: "No inpu", message: "Please enter something", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
                
            } else {
                // clear text
                myTextInput.text = ""
                myTextInput.resignFirstResponder()
                
                // change view
                performSegue(withIdentifier: "gotoView2", sender: inputText)
            }
            
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoView2" {
            if let lightRed = segue.destination as? lightRedViewController {
                lightRed.delegate = self
                lightRed.infoFromViewOne = sender as? String
            }
        }
    }
    
}

