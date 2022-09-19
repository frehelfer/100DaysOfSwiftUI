import Cocoa
import CoreFoundation

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Default Au, AU!!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("GRR gRR. Houf, Houf!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("au au!")
    }
}

let poodle = Poodle(legs: 4)
poodle.speak()
let corgi = Corgi(legs: 5)
corgi.speak()

class Cat: Animal {
    let isTame: Bool
    
    func speak() {
        print("Miau")
    }
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

final class Persian: Cat {
    override func speak() {
        print("MIIAAAUUU")
    }
}

final class Lion: Cat {
    override func speak() {
        print("GRRRRR Miau")
    }
}
