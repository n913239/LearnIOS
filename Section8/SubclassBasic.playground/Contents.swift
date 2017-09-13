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

class CuteBaby: Baby {
    var nickname:String
    func danceAndSing() {
        print("dance and sing")
    }
    override func sleep() {
        print("sleep with cute smile")
        super.sleep()
    }
    override func introduceSelf() {
        print("My name is \(nickname)")
    }
    override init() {
        nickname = "QQ"
        super.init()
    }
}

let iAMSoQ = CuteBaby()
iAMSoQ.nickname
iAMSoQ.sleep()






