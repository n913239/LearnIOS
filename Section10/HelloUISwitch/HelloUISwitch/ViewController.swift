//
//  ViewController.swift
//  HelloUISwitch
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func makeAChange(_ sender: UISwitch) {
        // use isOn to check the status of the switch
        if sender.isOn == true {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.black
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySwitch.isOn = false
        makeAChange(mySwitch)
        
        // generate a switch using code
        let codeSwitch = UISwitch(frame: CGRect(x: view.frame.midX - 51 / 2, y: view.frame.maxY - 100, width: 51, height: 31))
        codeSwitch.isOn = true
        codeSwitch.addTarget(self, action: #selector(ViewController.codeSwitchChange(sender:)), for: .valueChanged)
        
        view.addSubview(codeSwitch)
    }
    
    @objc func codeSwitchChange(sender: UISwitch) {
        // use isOn to check the status of the switch
        if sender.isOn == true {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.black
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

