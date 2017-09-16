//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func Play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // getAudio()
        
        // guard 的寫法
        guard let newPath = Bundle.main.path(forResource: "Right", ofType: "mp3") else {
            print("no such path")
            return
        }
        
        do {
            let url = URL(fileURLWithPath: newPath)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
        
    }

    func getAudio() {
        // find sound path
        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3") {
            // path to url
            let url = URL(fileURLWithPath: path)
            // make an audio player
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                // 播放速度調整
                audioPlayer?.enableRate = true
                // 播放速度 2.0 倍
                //audioPlayer?.rate = 2.0
                // 重複播放次數， -1 代表無限循環播放
                audioPlayer?.numberOfLoops = -1
                // 調整音量大小
                audioPlayer?.volume = 0.3
            } catch {
                // 列印錯誤
                print(error.localizedDescription)
            }
        } else {
            print("no such file")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

