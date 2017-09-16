//
//  ViewController.swift
//  HelloPlaySystemSound
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBAction func play(_ sender: UIButton) {
        for i in 1000...1030 {
            print("\(i)")
            AudioServicesPlaySystemSound(SystemSoundID(i))
            sleep(2)
        }
        
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

