//
//  ViewController.swift
//  HelloObjectC
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculator = OBJCCalculator()
        calculator.add(5, secondNumber: 10)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

