//
//  ViewController.swift
//  HelloRecordAudio
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    var recordHelper: RecordHelper?
    
    @IBAction func recordAudio(_ sender: UIButton) {
        recordHelper?.recordAudio()
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        recordHelper?.stopRecord()
    }
    
    @IBAction func playRecordSound(_ sender: UIButton) {
        recordHelper?.playRecordSound()
    }
    
    @IBAction func stopPlay(_ sender: UIButton) {
        recordHelper?.stopPlay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordHelper = RecordHelper()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

