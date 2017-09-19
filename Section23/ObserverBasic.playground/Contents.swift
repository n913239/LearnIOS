// Property Observer
class Sample {
    var myNumber: Int? {
        willSet {
            print("will set from \(myNumber) to \(newValue)")
        }
        didSet{
            print("did set to \(myNumber) from \(oldValue)")
        }
    }
    func nextMove() {
        print("Hello")
    }
}
let sample = Sample()
sample.myNumber = 200
sample.myNumber
