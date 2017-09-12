// dictionary
var fruitDict:[String:String] =  ["red":"apple", "yellow":"banana", "green":"mango"]
fruitDict["red"]
fruitDict["red2"]

fruitDict["green"] = "watermelon"
fruitDict.updateValue("kiwi", forKey: "green")

fruitDict["orange"] = "orange"

fruitDict.updateValue("peach", forKey: "pink")

fruitDict["red"] = nil

fruitDict.removeValue(forKey: "yellow")

var score:[String:Int] = ["english":90, "chinese": 95, "sport": 80]
score["chinese"]

score["english"] = 80
