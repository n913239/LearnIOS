//
//  BigLabelButton.swift
//  QuickDial
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class BigLabelButton: UIButton {

    let bigLabel = UILabel()
    
    var colorArray:[UIColor]?
    var colorPressArray:[UIColor]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        bigLabel.text = "Long Press"
        // 文字顏色
        bigLabel.textColor = UIColor.white
        // 文字陰影
        bigLabel.shadowColor = UIColor.black
        addSubview(bigLabel)
        
        colorArray = [
            UIColor(red: 0.91, green: 0.26, blue: 0.12, alpha: 1),
            UIColor(red: 0.98, green: 0.66, blue: 0.023, alpha: 1),
            UIColor(red: 0.01, green: 0.63, blue: 0.51, alpha: 1),
            UIColor(red: 0.04, green: 0.67, blue: 0.86, alpha: 1),
            UIColor(red: 0.01, green: 0.5, blue: 0.81, alpha: 1)
        ]
        
        colorPressArray = [
            UIColor(red: 0.79, green: 0.15, blue: 0, alpha: 1),
            UIColor(red: 0.86, green: 0.54, blue: 0, alpha: 1),
            UIColor(red: 0, green: 0.51, blue: 0.4, alpha: 1),
            UIColor(red: 0, green: 0.55, blue: 0.74, alpha: 1),
            UIColor(red: 0, green: 0.38, blue: 0.7, alpha: 1)
        ]
        
    }
    
    
}
