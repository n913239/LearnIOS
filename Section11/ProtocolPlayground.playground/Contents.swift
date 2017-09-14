// Protocol
protocol MoneyTransferProtocol {
    func giveMoney()
}

class RichPeople: MoneyTransferProtocol {
    func giveMoney() {
        print("Give you 100 dollars")
    }
}

class NormalProple: MoneyTransferProtocol {
    func giveMoney() {
        print("Give you 10 dollars")
    }
}

class PoorGuy {
    var helper: MoneyTransferProtocol?
    func needMoney() {
        helper?.giveMoney()
    }
}
let aPoorGuy = PoorGuy()
let aRichPeople = RichPeople()
let aNormalPeople = NormalProple()

aPoorGuy.helper = aRichPeople
aPoorGuy.helper = aNormalPeople
aPoorGuy.needMoney()


protocol Workable {
    func work()
}

class Worker: Workable {
    func work() {
        print("working from 9 to 5")
    }
}

class Boss {
    var delegate: Workable?
    func makeMoney() {
        delegate?.work()
    }
}

let aBoos = Boss()
let aWorker = Worker()
aBoos.delegate = aWorker
aBoos.makeMoney()


// PickerView
protocol PickerViewDelegate {
    func titleForRow()
}
protocol PickerViewDataSource {
    func numberOfComponents()
    func numberOfRowInComponent()
}

class ViewController : PickerViewDelegate, PickerViewDataSource {
    func titleForRow() {
        print("titleForRow")
    }
    func numberOfComponents() {
        print("2")
    }
    func numberOfRowInComponent() {
        print("10")
    }
}
class PickerView {
    var delegate: PickerViewDelegate?
    var dataSource: PickerViewDataSource?
    func wharToShow() {
        delegate?.titleForRow()
    }
    func howManyComponent() {
        dataSource?.numberOfComponents()
    }
    func howManyRow() {
        dataSource?.numberOfRowInComponent()
    }
}

let aPickerView = PickerView()
let aViewController = ViewController()
aPickerView.delegate = aViewController
aPickerView.wharToShow()

// Protocol 2
protocol MankindType {
    var health: Int { get set }
}
protocol Attackable {
    func attack(target:Hurtable)
}
protocol Hurtable: MankindType {
    func getHurt()
}

class Man: MankindType, Hurtable {
    var health:Int
    init() {
        health = 10
    }
    func getHurt() {
        health -= 10
    }
}
class Batman: MankindType, Attackable, Hurtable {
    var health:Int
    init() {
        health = 1000
    }
    func getHurt() {
        health -= 5
    }
    func attack(target:Hurtable) {
        target.getHurt()
    }
}
class Superman: MankindType, Attackable, Hurtable {
    var health:Int
    init() {
        health = 10000
    }
    func getHurt() {
        health -= 1
    }
    func attack(target:Hurtable) {
        target.getHurt()
    }
}
