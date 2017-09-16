//
//  ViewController.swift
//  HelloGCD
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = {
            for i in 1...5 {
                print("Task1: \(i)")
            }
        }
        
        let task2 = {
            for i in 1...5 {
                print("Task2: \(i)")
            }
        }
        // 共時佇列
        DispatchQueue.global().async(execute: task1)
        DispatchQueue.global().async(execute: task2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

