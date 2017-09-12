// Optional
var x:Int? = 5

// Force Unwrapping
x! + 2

// if and Optional
if x != nil {
    x! + 1
}

// Optional !
var luckyNumber:Int!
print(luckyNumber)

// Optional Binding
if let myNumber = x {
    myNumber + 1
}

var highscore:Int
var loadedScore:Int? = 1000

if let okScore = loadedScore {
    highscore = okScore
} else {
    highscore = 0
}
highscore = loadedScore != nil ? loadedScore! : 0
highscore = loadedScore ?? 0
