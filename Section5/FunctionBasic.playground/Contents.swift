// Function without parameter
func makeCake(){
    print("Cream the egg and sugar")
    print("Add Butter to it")
    print("Add Flour to it and mix")
    print("Bake it with oven")
}
makeCake()

// Function with parameter
func eat(foodname:String) {
    print("I want to have \(foodname)")
}
eat(foodname: "noodle")

// Funtion and return
func add(number1:Int, number2:Int) -> Int {
    return number1 + number2
}
add(number1: 2, number2: 3)

func multiply(number1:Int, number2:Int) -> String {
    return "\(number1 * number2)"
}
print(multiply(number1: 4, number2: 5))

// Function with Enternal paramter

