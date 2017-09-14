//
//  FourthViewController.swift
//  HelloTabBarApplication
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
}
