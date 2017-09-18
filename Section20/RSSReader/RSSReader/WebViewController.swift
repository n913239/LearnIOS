//
//  WebViewController.swift
//  RSSReader
//
//  Created by mikewang on 2017/9/18.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var webAddressFromViewOne:String?
    
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myWebView.delegate = self
        if let okAddress = webAddressFromViewOne {
            if let url = URL(string: okAddress) {
                let request = URLRequest(url: url)
                myWebView.loadRequest(request)
            }
        }
        
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

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
}
