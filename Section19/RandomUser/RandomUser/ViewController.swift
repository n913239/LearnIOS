//
//  ViewController.swift
//  RandomUser
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var infoTableViewController:InfoTableViewController?
    let apiAddress = "https://randomuser.me/api/"
    let reachability = Reachability(hostName: "www.apple.com")
    // 需要用到的時候才產生
    lazy var session = { return URLSession(configuration: .default) }()
    var isDownloading = false
    
    @IBAction func makeNewUser(_ sender: UIBarButtonItem) {
        if isDownloading == false {
            downloadWithURLSession(webAddress: apiAddress)
        }
    }
    
    func internetOK() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            return false
        } else {
            return true
        }
    }
    
    // 第一種下載方法
    func downloadWithURLSession(webAddress:String) {
        if let url = URL(string: webAddress) {
            if internetOK() == true {
                let task = session.dataTask(with: url, completionHandler: {
                    (data, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "Sorry", andMessage: error!.localizedDescription)
                        }
                        self.isDownloading = false
                        return
                    }
                    if let downloadedData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: downloadedData, options: [])
                            self.parseJSON(json: json)
                        } catch {
                            DispatchQueue.main.async {
                                self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription)
                            }
                        }
                    } else {
                        self.isDownloading = false
                    }
                })
                task.resume()
                isDownloading = true
            } else {
                popAlert(withTitle: "No Internet", andMessage: "Please try again later!")
            }
        } else {
            popAlert(withTitle: "Sorry", andMessage: "Can't generate random user now!")
        }
    }
    
    // 第二種下載方法
    func downloadWithData(webAddress:String) {
        if let url = URL(string: webAddress) {
            if internetOK() == true {
                DispatchQueue.global().async {
                    do {
                        let downloadedData = try Data(contentsOf: url)
                        let json = try JSONSerialization.jsonObject(with: downloadedData, options: [])
                        DispatchQueue.main.async {
                            self.parseJSON(json: json)
                        }
                        
                    } catch {
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription)
                        }
                    }
                }
            } else {
                popAlert(withTitle: "No Internet", andMessage: "Please try again later!")
            }
        } else {
            popAlert(withTitle: "Sorry", andMessage: "Can't generate random user now!")
        }
    }
    
    func parseJSON(json:Any) {
        if let okJSON = json as? [String:Any] {
            if let infoArray = okJSON["results"] as? [[String:Any]] {
                let infoDictionary = infoArray[0]
                let loadedName = userFullName(nameDictionary: infoDictionary["name"])
                let loadedEmail = infoDictionary["email"] as? String
                let loadedPhone = infoDictionary["phone"] as? String
                let imageDictionary = infoDictionary["picture"] as? [String:String]
                let loadedImageAddress = imageDictionary?["large"]
                let loadedUser = User(name: loadedName, email: loadedEmail, number: loadedPhone, image: loadedImageAddress)
                settingInfo(user: loadedUser)
            } else {
                isDownloading = false
            }
        } else {
            isDownloading = false
        }
    }
    
    func userFullName(nameDictionary:Any?) -> String? {
        if let okDictionary = nameDictionary as? [String:String] {
            let firstName = okDictionary["first"] ?? ""
            let lastName = okDictionary["last"] ?? ""
            return firstName + " " + lastName
        } else {
            return nil
        }
    }
    
    func popAlert(withTitle title:String, andMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func settingInfo(user:User) {
        AudioServicesPlaySystemSound(1000)
        userName.text = user.name
        infoTableViewController?.phoneLabel.text = user.number
        infoTableViewController?.emailLabel.text = user.email
        if let imageAddress = user.image {
            if let imageURL = URL(string: imageAddress) {
                let task = session.downloadTask(with: imageURL, completionHandler: {
                    (url, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "Sorry", andMessage: error!.localizedDescription)
                        }
                        return
                    }
                    if let okURL = url {
                        do {
                            let downloadedImage = UIImage(data: try Data(contentsOf: okURL))
                            DispatchQueue.main.async {
                                self.userImage.image = downloadedImage
                                self.isDownloading = false
                            }
                        } catch {
                            DispatchQueue.main.async {
                                self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription)
                                self.isDownloading = false
                            }
                        }
                        
                    }
                })
                
                task.resume()
            } else {
                isDownloading = false
            }
        } else {
            isDownloading = false
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.67, green: 0.2, blue: 0.157, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor:UIColor.white]
        
        // test static data
        //let aUser = User(name: "Mike Wang", email: "mike@yahoo.com", number: "888-8888", image: "http://picture.me")
        //settingInfo(user: aUser)
        
        //downloadWithData(webAddress: apiAddress)
        downloadWithURLSession(webAddress: apiAddress)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // make user image circle
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo" {
            infoTableViewController = segue.destination as? InfoTableViewController
            
        }
    }


}

