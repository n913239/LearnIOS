//
//  ViewController.swift
//  HelloUserDefault
//
//  Created by mikewang on 2017/9/16.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // save info to user defaults
        UserDefaults.standard.set("Mike", forKey: "name")
        UserDefaults.standard.synchronize()
        
        // load info from user defaults
        if let loadedName = UserDefaults.standard.value(forKey: "name") as? String {
            print(loadedName)
        }
        
        let fruitArray = ["apple", "banana", "mango"]
        UserDefaults.standard.set(fruitArray, forKey: "sweetFruit")
        UserDefaults.standard.synchronize()
        
        // UserDefaults.standard.value(forKey: "sweetFruit") as? [String]
        //UserDefaults.standard.array(forKey: "sweetFruit")
        if let loadedFruit = UserDefaults.standard.stringArray(forKey: "sweetFruit") {
            print(loadedFruit[0])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

