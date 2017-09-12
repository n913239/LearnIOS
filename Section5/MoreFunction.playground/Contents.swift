// Function with External parameter
func calculateArea(withWidth width:Float, andHeight height:Float) -> Float {
    return width * height
}
//calculateArea(width: 20.5, height: 30.5)
calculateArea(withWidth: 20.5, andHeight: 30.5)

func buy(_ thing:String, withMoney money:Int) {
    print("I want to buy \(thing) with \(money) dollars")
}
buy("iPhone", withMoney: 300)

// scope
var perfact = 200

func add(number1:Int, number2:Int) -> Int {
    let perfact = 100
    let result =  number1 + number2 + perfact
    return result
}

add(number1: 5, number2: 10)
