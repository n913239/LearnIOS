// if

var price = 50

if price == 50 {
    "buy it" // what to do if price is equal to 50
}

if price > 150 {
    "are you crazy?"
} else if price < 40 {
    "very cheap"
} else {
    "buy it"
}

let myName = "Thomas"
let time = 7
let isHungry = true

if myName == "Thomas" && time < 12 {
    "Good Morning, \(myName)"
    if isHungry == true {
        "Do you want to have some breakfast"
    }
} else if myName == "Friedrich" {
    "Guten Tag, \(myName)"
} else {
    "Who are you"
}
