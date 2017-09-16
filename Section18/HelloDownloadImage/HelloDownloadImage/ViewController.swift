//
//  ViewController.swift
//  HelloDownloadImage
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageAddress = "http://wallsdesk.com/wp-content/uploads/2016/04/Angelababy-full-HD.jpg"
        if let imageURL = URL(string: imageAddress) {
            DispatchQueue.global().async {
                do {
                    let downloadImage = UIImage(data: try Data(contentsOf: imageURL))
                    // 回到主佇列更新畫面
                    DispatchQueue.main.async {
                        self.myImageView.image = downloadImage
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

