//
//  DeleteEditViewController.swift
//  QuickDial
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class DeleteEditViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var backgroundColorInfo: UIColor? {
        didSet {
            if backgroundColorInfo != nil {
                view.backgroundColor = backgroundColorInfo!
            }
        }
    }

    // 回到主畫面
    @IBAction func backToMenu(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // 前往刪除畫面
    @IBAction func deleteEntry(_ sender: UIButton) {
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            let context = appDel.persistentContainer.viewContext
            do {
                let results = try context.fetch(Friend.fetchRequest())
                if let friend = results[appDel.tempData.id] as? Friend {
                    friend.name = ""
                    friend.number = ""
                    appDel.saveContext()
                    appDel.friendMatrix[appDel.tempData.id] = friend
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // 前往編輯畫面
    @IBAction func editEntry(_ sender: UIButton) {
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            if let name = appDel.friendMatrix[appDel.tempData.id].name,
            let number = appDel.friendMatrix[appDel.tempData.id].number {
                appDel.tempData.name = name
                appDel.tempData.number = number
            }
        }        
        performSegue(withIdentifier: "edit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let dvc = segue.destination as? SettingNameViewController
            dvc?.backgroundColorInfo = view.backgroundColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
