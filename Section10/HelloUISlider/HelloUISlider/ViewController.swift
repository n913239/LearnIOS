//
//  ViewController.swift
//  HelloUISlider
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func sliderChanged(_ sender: UISlider) {
        myLabel.text = "\(Int(sender.value))"
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

