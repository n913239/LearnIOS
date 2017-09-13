//
//  ViewController.swift
//  HelloUISegmentedcontrol
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func myToggleChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = UIColor.white
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = UIColor.black
        } else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = UIColor.red
        } else if sender.selectedSegmentIndex == 3 {
            view.backgroundColor = UIColor.orange
        } else if sender.selectedSegmentIndex == 4 {
            view.backgroundColor = UIColor.yellow
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

