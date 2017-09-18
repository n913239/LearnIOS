//
//  DetailViewController.swift
//  HelloSplitViewController
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var detailItem:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if detailItem == nil {
            title = "iPhone"
            detailDescriptionLabel.text = "iPhone"
        } else {
            title = detailItem
            detailDescriptionLabel.text = detailItem
        }
    }




}

