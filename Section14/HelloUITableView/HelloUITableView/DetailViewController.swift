//
//  DetailViewController.swift
//  HelloUITableView
//
//  Created by mikewang on 2017/9/16.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var inforFromViewOne:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let animalName = inforFromViewOne else { return }
        
        myLabel.text = animalName
        
        myImageView.image = UIImage(named: animalName)
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
