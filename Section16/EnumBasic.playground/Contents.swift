enum Direction {
    case east
    case west
    case south
    case north
}
let myDirection:Direction = Direction.east

// 沒有採用enum
func whichDirectionToGo(direction:String) {
    if direction == "east" {
        print("go east")
    } else if direction == "west" {
        print("go west")
    } else if direction == "north" {
        print("go north")
    }else if direction == "south" {
        print("go south")
    }
}

// 採用enum的寫法
func whichDirectionToGo(direction:Direction) {
    if direction == .east {
        print("go east")
    } else if direction == .west {
        print("go west")
    } else if direction == .north {
        print("go north")
    }else if direction == .south {
        print("go south")
    }
}
whichDirectionToGo(direction: .west)

// enum sample2
enum Season {
    case spring, summer, actumn, winter
}
