//
//  ViewController.swift
//  RSSReader
//
//  Created by mikewang on 2017/9/18.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var objects = [NewsItem]()
    var reachability = Reachability(hostName: "www.apple.com")
    lazy var session = { return URLSession(configuration: .default) } ()
    
    func internetOK() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            return false
        } else {
            return true
        }
    }
    
    func downloadXML(webAddress:String) {
        if internetOK() == true {
            // start download
            if let url = URL(string: webAddress) {
                let task = session.dataTask(with: url, completionHandler: {
                    (data, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "Error", andMessage: error!.localizedDescription)
                        }
                        return
                    }
                    if let okData = data {
                        //let x = NSString(data: okData, encoding: String.Encoding.utf8.rawValue)
                        let parser = XMLParser(data: okData)
                        let rssParserDelegate = RSSParserDelegate()
                        parser.delegate = rssParserDelegate
                        if parser.parse() == true {
                            self.objects = rssParserDelegate.getResult()
                            DispatchQueue.main.async {
                                self.myTableView.reloadData()
                            }                            
                        } else {
                            print("parser fail")
                        }
                    }
                })
                task.resume()
            }
        } else {
            popAlert(withTitle: "No internet", andMessage: "Please try again later!")
        }
    }
    
    func popAlert(withTitle title:String, andMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        let news1 = NewsItem(title: "first news", link: "https://www.apple.com")
        let news2 = NewsItem(title: "second news", link: "https://www.nike.com")
        let news3 = NewsItem(title: "third news", link: "https://www.udemy.com")
        objects.append(news1)
        objects.append(news2)
        objects.append(news3)
        downloadXML(webAddress: "https://www.cnet.com/rss/iphone-update/")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo" {
            if let dvc = segue.destination as? WebViewController {
                if let selectedRow = myTableView.indexPathForSelectedRow?.row {
                    dvc.webAddressFromViewOne = objects[selectedRow].link
                }
                
            }
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = objects[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
