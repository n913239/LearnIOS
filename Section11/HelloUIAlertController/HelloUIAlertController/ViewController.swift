//
//  ViewController.swift
//  HelloUIAlertController
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: UIButton) {
        let myAlert = UIAlertController(title: "Hello", message: "How are you?", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        
        let helloAction = UIAlertAction(title: "Say Hello", style: .destructive) { (action:UIAlertAction) in
            print("Hello")
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(helloAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("Cancel")
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(cancelAction)
        
        present(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

