// while
var index = 1
while index <= 10 {
    index += 2
}

index = 0
var animalArray = ["cat", "dog", "lion", "tiger"]

while index < animalArray.count {
    print(animalArray[index])
    index += 1
}

// repeat & while
var myCounter = 1
repeat {
    print("Just do it \(myCounter) time")
    myCounter += 1
} while myCounter < 11
