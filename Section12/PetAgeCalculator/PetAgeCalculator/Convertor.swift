//
//  Convertor.swift
//  PetAgeCalculator
//
//  Created by mikewang on 2017/9/15.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation

class Convertor {
    var catyears = [15,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100]
    var dogyears = [17,23,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100]
    
    func convertAge(_ age:Int, fromThisPetType petType:String) -> Int {
        if petType == "cat" {
            return catyears[age]
        } else {
            return dogyears[age]
        }
    }
}
