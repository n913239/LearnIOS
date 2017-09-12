// for loop
var animalArray = ["cat", "dog", "lion", "tiger"]

for animal in animalArray {
    print(animal)
}

//let numberArray = [1,2,3,4,5,6,7,8,9,10]
let numberArray = (1...10)
var anotherNumberArray:[Int] = []

for number in numberArray {
    print(number)
    anotherNumberArray.append(number + 2)
}

anotherNumberArray

let nameArray = ["David","Sophie","Thomas","Sunny","Ryan","Hello"]

//create a lower case name array
var lowerCasedNameArray:[String] = []
for name in nameArray{
    lowerCasedNameArray.append(name.lowercased())
}
lowerCasedNameArray

for _ in 1...3 {
    print("Hi")
}

for index in 1...10 where index % 2 == 0 {
    print(index)
}

var fruitDict = ["red":"apple", "yellow":"banana", "green":"mango"]

for (key, value) in fruitDict {
    print(key + ": " + value)
}

// Tuple
let colors = ("red", "orange", "yello", "green", "blue")
colors.0

let someTuple = ("Hello", 3.14, true, ["apple", "banana"])
someTuple.3[0]

var fruitTuple = (red:"apple", yellow:"banana", green:"mango")
fruitTuple.red
fruitTuple.2
