class Person {
    var firstname:String
    var lastName:String
    var fullname:String
    init() {
        firstname = "Mike"
        lastName = "Wang"
        fullname = firstname + lastName
        print("a person is being initialized")
    }
    deinit {
        print("a person is being deinitialized")
    }
}

var person1:Person? = Person()
var person2:Person? = person1

person1 = nil
person2 = nil

var number1 = 1
var number2 = number1

number1  = 10
number2




