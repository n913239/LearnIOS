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

    var audioRecord:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isRecording = false
    
    enum AudioSessionMode {
        case record, play
    }
    
    // 設定錄音初始化
    func setAudioRecord() {
        // init an audio record
        let filename = "User.wav"
        let path = "\(NSHomeDirectory())/Documents\(filename)"
        let url = URL(fileURLWithPath: path)
        // set record setting
        let recordSettings:[String:Any] = [
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        do {
            audioRecord = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecord?.delegate = self
        } catch {
            print(error.localizedDescription)
        }
    }
    // 設定 音訊工作階段
    func settingAudioSession(mode:AudioSessionMode) {
        let session = AVAudioSession.sharedInstance()
        do {
            switch mode {
            case .record:
                try session.setCategory(AVAudioSessionCategoryRecord)
            case .play:
                try session.setCategory(AVAudioSessionCategoryPlayback)
                try session.setActive(false)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        settingAudioSession(mode: .record)
        audioRecord?.prepareToRecord()
        audioRecord?.record()
        isRecording = true
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        audioRecord?.stop()
        isRecording = false
        settingAudioSession(mode: .play)
    }
    
    @IBAction func playRecordSound(_ sender: UIButton) {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
            audioPlayer?.play()
        }
    }
    
    @IBAction func stopPlay(_ sender: UIButton) {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
        }
    }
    
    // 錄音結束後，要做的事情
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAudioRecord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

