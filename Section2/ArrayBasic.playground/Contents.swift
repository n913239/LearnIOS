var animalArray:[String] =  ["cat", "dog", "lion", "tiger"]

animalArray[0]

animalArray.count

animalArray.append("rabbit")

animalArray.insert("cow", at: 2)

animalArray.remove(at: 0)
animalArray.remove(at: 2)

animalArray.removeLast()

animalArray.removeFirst()

animalArray.reverse()

var anotherAnimalArray = ["pony", "sheep", "monkey"]

animalArray = animalArray + anotherAnimalArray
animalArray[1] = "bird"

