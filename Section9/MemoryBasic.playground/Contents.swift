class Person {
    weak var heart: Heart?
    init() {
        print("a person is being initialized")
    }
    deinit {
        print("a person is being deinitialized")
    }
}

class Heart {
    weak var person: Person?
    init() {
        print("a heart is being initialized")
    }
    deinit {
        print("a heart is being deinitialized")
    }
}

var aPerson:Person? = Person()
var aHeart:Heart? = Heart()

// retain cycle
aPerson?.heart = aHeart
aHeart?.person = aPerson

aPerson = nil
