//
//  ViewController.swift
//  HelloUIView
//
//  Created by mikewang on 2017/9/13.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var midRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background color
        midRect.backgroundColor = UIColor.green
        
        // set transparency 0 ~ 1
        midRect.alpha  = 0.5
        
        // hide UIView, make it invisible
        midRect.isHidden = true
        
        self.view.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        //self.view.viewWithTag(101)?.backgroundColor = UIColor.yellow
        
        // make UIView with code
        let viewArea = CGRect(x: 67, y: 462, width: 97, height: 95)
        let smallRect = UIView(frame:viewArea)
        smallRect.backgroundColor = UIColor.purple
        self.view.viewWithTag(101)?.addSubview(smallRect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

