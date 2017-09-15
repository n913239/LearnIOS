//
//  lightGreenViewController.swift
//  HelloSwitchingViewsAgain
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class lightGreenViewController: UIViewController {

    
    @IBAction func backtoView2(_ sender: UIButton) {
        //let _ = navigationController?.popToRootViewController(animated: true)
        
        // let _ = navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
