import Cocoa

let array = [5, 10, 20, 94, 2, 6, 93, 58, 43, 11]

func randomIntFromArray(_ array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

print(randomIntFromArray(array))
