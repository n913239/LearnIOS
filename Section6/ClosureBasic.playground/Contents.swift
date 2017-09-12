// Closure
let helloClosure:()->String = { "Hello EveryOne" }
helloClosure()

let eatClosure:(String)->() = {
    (foodName:String) in
    print("I want to have \(foodName)")
}
eatClosure("apple pie")

let addClosure:(Int,Int) -> Int = {
    (number1:Int, number2:Int) -> Int in
    return number1 + number2
}

let multiplyClosure:(Int,Int)->String = {
    (number1:Int, number2:Int) -> String in
    return "\(number1) * \(number2)  = \(number1 * number2)"
}
multiplyClosure(2, 3)

func calculate(num1:Int, num2:Int, operation:(Int,Int)->(Int)) {
    print(operation(num1,num2))
}

calculate(num1: 3, num2: 8, operation: addClosure)

func giveMeMultiply() -> (Int,Int)->(String) {
    return multiplyClosure
}

let doMultiply = giveMeMultiply()
doMultiply(3, 5)

func giveMeCounter() -> ()->(Int) {
    var counterNumber = 0
    return {
        () -> Int in
        counterNumber += 1
        return counterNumber
    }
}
let counter = giveMeCounter()
counter()

