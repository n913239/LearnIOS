class Lego {
    // property
    var color:String = "blue"
    var size:Int = 8
    // method
    func connect() {
        print("connect with another block")
    }
    func remove() {
        print("disconnect with another block")
    }
}

let oneBlock = Lego()
oneBlock.color
oneBlock.size

class Baby {
    var name:String
    var age:Int
    func sleep() {
        print("sleep")
    }
    func introduceSelf() {
        print("My name is \(name)")
    }
    
    init() {
        name = "Mike"
        age = 1
        introduceSelf()
    }
    
    init(name:String) {
        self.name = name
        age = 1
    }
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}
let babyNumberOne = Baby()
babyNumberOne.name



