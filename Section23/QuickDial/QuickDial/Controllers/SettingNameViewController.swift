//
//  SettingNameViewController.swift
//  QuickDial
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class SettingNameViewController: UIViewController {
    
    var backgroundColorInfo: UIColor? {
        didSet {
            if backgroundColorInfo != nil {
                view.backgroundColor = backgroundColorInfo!
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    // 回到主畫面
    @IBAction func backToMain(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 彈出鍵盤
        nameTextField.becomeFirstResponder()
        // 設定編輯資料
        let appDel = UIApplication.shared.delegate as? AppDelegate
        nameTextField.text = appDel?.tempData.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSettringNumber" {
            let dvc = segue.destination as? SettingNumberViewController
            dvc?.backgroundColorInfo = view.backgroundColor
        }
    }
}

extension SettingNameViewController: UITextFieldDelegate {
    // 是否可以按下 return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard nameTextField.text != nil else { return false }
        if nameTextField.text == "" {
            let myAlert = UIAlertController(title: "Ooops!", message: "Please enter a contact name", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(myAlert, animated: true, completion: nil)
            return false
        } else {
            let appDel = UIApplication.shared.delegate as? AppDelegate
            appDel?.tempData.name = nameTextField.text!
            performSegue(withIdentifier: "showSettingNumber", sender: nil)
            return true
        }        
    }
}
