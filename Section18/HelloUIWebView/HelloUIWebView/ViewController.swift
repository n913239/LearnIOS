//
//  ViewController.swift
//  HelloUIWebView
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            myWebView.loadRequest(request)
            
        }
    }

    // 開始載入網頁
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    
    // 網頁讀取完畢
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

