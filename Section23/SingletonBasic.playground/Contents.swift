// Singleton Pattern
class DataController {
    let name = "Mike"
    var colorArray = ["red", "green", "blue"]
    // 類別方法
    class func sayhello() {
        print("Hello Everybody!")
    }
    private init() { }
    
    static let shared = DataController()
}

DataController.shared.colorArray[0]

protocol ApplicationDelegate {
    func finishedLaunching()
}

class Application {
    static let shared = Application()
    private init() { }
    var delegate: ApplicationDelegate?
    
}

class AppDelegate: ApplicationDelegate {
    func finishedLaunching() {
        print("finished launching")
    }
}

Application.shared.delegate = AppDelegate()
