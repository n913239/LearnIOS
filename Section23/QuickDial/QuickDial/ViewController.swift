//
//  ViewController.swift
//  QuickDial
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button1: BigLabelButton!
    @IBOutlet weak var button2: BigLabelButton!
    @IBOutlet weak var button3: BigLabelButton!
    @IBOutlet weak var button4: BigLabelButton!
    @IBOutlet weak var button5: BigLabelButton!
    var buttonArray:[BigLabelButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonArray = [button1, button2, button3, button4, button5]
    
        
    }

    override func viewDidLayoutSubviews() {
        let viewWidth = view.frame.size.width
        let viewHeight = view.frame.size.height
        if let okArray = buttonArray {
            for button in okArray {
                button.bigLabel.frame = CGRect(x: 28, y: 0, width: viewWidth - 28, height: viewHeight / 5)
                button.bigLabel.font = UIFont(name: "Arial-BoldMT", size: viewHeight * 0.075)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

