//
//  ViewController.swift
//  HelloSwitchingViewsAgain
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func gotoView2(_ sender: UIButton) {
        // change view controller
        let lightRed = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightRed")
        
        // from bottom to top
        //present(lightRed, animated: true, completion: nil)
        
        // from right to left
        self.navigationController?.pushViewController(lightRed, animated: true)
        
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

