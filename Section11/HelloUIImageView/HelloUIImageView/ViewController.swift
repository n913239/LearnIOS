//
//  ViewController.swift
//  HelloUIImageView
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPet: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // myPet.image = UIImage(named: "MyCat")
        // 直接輸入圖片名稱就可以簡寫
        myPet.image = #imageLiteral(resourceName: "MyCat")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

