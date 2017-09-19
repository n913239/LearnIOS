//
//  SettingNumberViewController.swift
//  QuickDial
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class SettingNumberViewController: UIViewController {

    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    // 回到前一個畫面
    @IBAction func backToSettingName(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 彈出鍵盤
        numberTextField.becomeFirstResponder()
        // 設定編輯資料
        let appDel = UIApplication.shared.delegate as? AppDelegate
        numberTextField.text = appDel?.tempData.number
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

extension SettingNumberViewController: UITextFieldDelegate {
    // 是否可以按下 return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard numberTextField.text != nil else { return false }
        
        if numberTextField.text == "" {
            let myAlert = UIAlertController(title: "Ooops!", message: "Please enter a contact number", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(myAlert, animated: true, completion: nil)
            return false
        } else {
            if let appDel = UIApplication.shared.delegate as? AppDelegate {
                appDel.tempData.number = numberTextField.text!
                let context = appDel.persistentContainer.viewContext
                
                do {
                    let results = try context.fetch(Friend.fetchRequest())
                    if let friend = results[appDel.tempData.id] as? Friend {
                        friend.name = appDel.tempData.name
                        friend.number = appDel.tempData.number
                        appDel.saveContext()
                        appDel.friendMatrix[appDel.tempData.id] = friend
                        
                        appDel.tempData.id = -1
                        appDel.tempData.name = ""
                        appDel.tempData.number = ""
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            navigationController?.popToRootViewController(animated: true)
            return true
        }
    }
    
}
