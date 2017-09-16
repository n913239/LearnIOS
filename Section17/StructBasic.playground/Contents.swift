// struct(value type) and class(reference type)
struct SizeStruct {
    var width: Float = 5.0
    var height: Float = 8.0
    func area() -> Float {
        return width * height
    }
}

class SizeClass {
    var width: Float = 5.0
    var height: Float = 8.0
    func area() -> Float {
        return width * height
    }
}

var sizeClass1 = SizeClass()
var sizeClass2 = sizeClass1
sizeClass1.width = 100
sizeClass2.width

var sizeStruct1 = SizeStruct()
var sizeStruct2 = sizeStruct1
sizeStruct1.width = 100
sizeStruct2.width

import UIKit
CGRect(x: 0, y: 0, width: 100, height: 100)

