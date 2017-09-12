// Prime function

func checkPrime(testNumber:Int) -> String {
    var isPrime = 1 // 1: is Prime; 2: is not Prime; 0: reenter
    
    if testNumber <= 0 {
        isPrime = 0 // reenter
    } else if testNumber == 1 {
        isPrime = 2 // not prime
    } else {
        for i in 2..<testNumber {
            if testNumber % i == 0 {
                // input number is not prime
                isPrime = 2
            }
        }
    }
    switch isPrime {
    case 1:
        return "\(testNumber) is prime"
    case 2:
        return "\(testNumber) is not prime"
    default:
        return "reenter"
    }
}
checkPrime(testNumber: 100)
checkPrime(testNumber: 59)
checkPrime(testNumber: 1)
checkPrime(testNumber: 0)
