//
//  ViewController.swift
//  Xylophone
//
//  Created by appsgaga on 2015/11/12.
//  Copyright © 2015年 appsgaga. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var audioMatrrix = [AVAudioPlayer?]()
    
    @IBAction func playSound(_ sender: UIButton) {
        var index = sender.tag
        audioMatrrix[index]?.stop()
        audioMatrrix[index]?.currentTime = 0.0
        audioMatrrix[index]?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...7 {
            guard let path = Bundle.main.path(forResource: "\(i + 1)", ofType: "mp3") else {
                audioMatrrix.append(nil)
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                audioMatrrix.append(try AVAudioPlayer(contentsOf: url))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

