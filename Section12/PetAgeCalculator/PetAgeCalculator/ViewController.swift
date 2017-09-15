//
//  ViewController.swift
//  PetAgeCalculator
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let convertor = Convertor()
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        let age = yearPicker.selectedRow(inComponent: 0)
        guard let petType = self.restorationIdentifier else { return }
        let resultAge = convertor.convertAge(age, fromThisPetType: petType)
        
        let resultAlert = UIAlertController(title: "Here you are!", message: "Your pet's age is \(resultAge) years old", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        
        resultAlert.addAction(okButton)
        present(resultAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // 修改黑色狀態列
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let yearNumber = row + 1
        if yearNumber == 1 {
            return "\(yearNumber) year old."
        } else {
            return "\(yearNumber) years old."
        }
    }
    
}
