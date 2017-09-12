// switch
let name = "Thomas"

if name == "Thomas" {
    print("That's me")
} else if name == "David" {
    print("That's my father")
} else if name == "Helen" {
    print("That's my monther")
} else if name == "Brenda" {
    print("That's my sister")
} else {
    print("Who are you?")
}

switch name {
case "Thomas":
    print("That's me")
case "David":
    print("That's my father")
case "Helen":
    print("That's my monther")
case "Brenda":
    print("That's my sister")
default:
    print("Who are you?")
}

let price = 80

switch price {
case 200...400:
    print("too expensive")
case 100...180:
    print("OK")
case 50:
    print("cheap")
default:
    print("Price has to be 200, 100, or 50")
}
