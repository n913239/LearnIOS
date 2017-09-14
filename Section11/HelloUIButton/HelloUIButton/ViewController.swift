//
//  ViewController.swift
//  HelloUIButton
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Hello world")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // how to make a system style button via code
        let newButton = UIButton(type: .system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: .normal)
        newButton.setTitle("Pressing", for: .highlighted)
        view.addSubview(newButton)
        newButton.addTarget(self, action: #selector(ViewController.hitMe(thisButton:)), for: .touchUpInside)
        
        // how to make an image button via code
        let anotherButton = UIButton(type: .custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 114, height: 54)
        anotherButton.setImage(#imageLiteral(resourceName: "PlayButton"), for: .normal)
        anotherButton.setImage(#imageLiteral(resourceName: "PlayButtonPressed"), for: .highlighted)
        view.addSubview(anotherButton)
        anotherButton.addTarget(self, action: #selector(ViewController.hitMe(thisButton:)), for: .touchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func hitMe(thisButton:UIButton) {
        print("hello, just pressed the button")
    }

}

