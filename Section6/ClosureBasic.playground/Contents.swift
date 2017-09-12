// Closure
let addClosure:(Int,Int) -> Int = { $0 + $1 }

func calculate(num1:Int, num2:Int, operation:(Int,Int)->(Int)) {
    print(operation(num1,num2))
}

// Array map()
var numberArray = [1,3,5,7,9,2,4,6,8,10]
numberArray.count

let numberArrayAddTen = numberArray.map { $0 + 10 }

let numberArrayToString = numberArray.map{ "This is number \($0)" }
numberArrayToString

// Array filter
let evenNumber = numberArray.filter { $0 % 2 == 0 }
evenNumber


