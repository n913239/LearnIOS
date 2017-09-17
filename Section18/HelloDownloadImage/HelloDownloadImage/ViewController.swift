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
    var session:URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageAddress = "http://wallsdesk.com/wp-content/uploads/2016/04/Angelababy-full-HD.jpg"
        // 下載圖片第一種
//        if let imageURL = URL(string: imageAddress) {
//            DispatchQueue.global().async {
//                do {
//                    let downloadImage = UIImage(data: try Data(contentsOf: imageURL))
//                    // 回到主佇列更新畫面
//                    DispatchQueue.main.async {
//                        self.myImageView.image = downloadImage
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        // 使用URLSession 下載圖片
        session = URLSession(configuration: .default)
        if let imageURL = URL(string: imageAddress) {
            // 使用 datatask
//            let task = session?.dataTask(with: imageURL, completionHandler: {
//                (data, response, error) in
//                if error != nil {
//                    print(error?.localizedDescription)
//                    return
//                } else {
//                    if let loadedData = data {
//                        let loadedImage = UIImage(data: loadedData)
//                        DispatchQueue.main.async {
//                            self.myImageView.image = loadedImage
//                        }
//                    }
//                }
//            })
//            task?.resume()
            
            // 使用 downloadTask， 會一邊下載一邊存到手機上某一個URL
            let newTask = session?.downloadTask(with: imageURL, completionHandler: {
                (url, response, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                if let loadedURL = url {
                    do {
                        let loadedImage = UIImage(data: try Data(contentsOf: loadedURL))
                        DispatchQueue.main.async {
                            self.myImageView.image = loadedImage
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            })
            newTask?.resume()
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

