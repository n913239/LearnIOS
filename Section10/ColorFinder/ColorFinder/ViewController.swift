//
//  ViewController.swift
//  ColorFinder
//
//  Created by mikewang on 2017/9/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redValue = 255
    var greenValue = 255
    var blueValue = 255
    
    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var greenText: UILabel!
    @IBOutlet weak var blueText: UILabel!
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = Int(sender.value)
        redText.text = "R: \(redValue)"
        chagneBackgroundColor()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = Int(sender.value)
        greenText.text = "G: \(greenValue)"
        chagneBackgroundColor()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = Int(sender.value)
        blueText.text = "B: \(blueValue)"
        chagneBackgroundColor()
    }
    
    func chagneBackgroundColor() {
        view.backgroundColor = UIColor(red: CGFloat(redValue) / 255.0, green: CGFloat(greenValue) / 255.0, blue: CGFloat(blueValue) / 255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

