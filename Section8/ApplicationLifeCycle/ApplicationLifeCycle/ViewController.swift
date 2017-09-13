//
//  ViewController.swift
//  ApplicationLifeCycle
//
//  Created by mikewang on 2017/9/13.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 用程式碼產生畫面
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // 讀入畫面後執行
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    // 畫面即將顯示到螢幕上
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    // 畫面已經顯示到螢幕上
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewDidAppear")
    }
    
    // 畫面即將離開螢幕
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    
    // 畫面已經離開螢幕
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

