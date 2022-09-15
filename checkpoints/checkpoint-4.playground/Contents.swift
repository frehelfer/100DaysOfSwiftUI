import Cocoa

enum squareRoot: Error {
    case outOfBounds
    case noRoot
}

func intSquareRoot(of number: Int) throws -> Int {
    if number < 1 && number > 10_000 {
        throw squareRoot.outOfBounds
    }
    
    var result = 0
    
    for i in 1...100 {
        let int = i * i
        if int == number {
            result = i
        }
    }
    
    if result == 0 {
        throw squareRoot.noRoot
    } else {
        return result
    }
}

do {
    let result = try intSquareRoot(of: 9)
    print(result)
} catch squareRoot.outOfBounds {
    print("Try a number between 1 and 10.000")
} catch squareRoot.noRoot {
    print("There's no integer square root for this number.")
}
