// ErrorHandling
enum NameINputError: Error {
    case empty
    case isNumber
}

func getUserFullname(firstname:String, lastname:String) throws -> String {
    if firstname == "" || lastname == "" {
        throw NameINputError.empty
    } else if Int(firstname) != nil || Int(lastname) != nil {
        throw NameINputError.isNumber
    }
    let fullname = firstname + " " + lastname
    return fullname
}

do {
    try getUserFullname(firstname: "", lastname: "Wang")
} catch NameINputError.empty {
    print("empty name")
} catch NameINputError.isNumber {
    print("input some number")
} catch {
    print("something is wrong")
}

do {
    try getUserFullname(firstname: "Mike", lastname: "123")
} catch NameINputError.empty {
    print("empty name")
} catch NameINputError.isNumber {
    print("input some number")
} catch {
    print("something is wrong")
}

do {
    let fullname = try getUserFullname(firstname: "Mike", lastname: "Wang")
    print(fullname)
} catch NameINputError.empty {
    print("empty name")
} catch NameINputError.isNumber {
    print("input some number")
} catch {
    print("something is wrong")
}

