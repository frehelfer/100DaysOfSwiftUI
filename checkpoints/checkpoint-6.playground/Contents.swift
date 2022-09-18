import Cocoa

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear: Int
    
    mutating func changeGears (upOrDown: String) {
        if upOrDown.lowercased() == "up" && currentGear >= 1 && currentGear <= 9 {
            currentGear += 1
            print("Current Gear up to \(currentGear)")
        } else if upOrDown.lowercased() == "up" && currentGear == 10 {
            print("That's not possible")
        } else if upOrDown.lowercased() == "down" && currentGear >= 2 && currentGear <= 10 {
            currentGear -= 1
            print("Current Gear down to \(currentGear)")
        } else if upOrDown.lowercased() == "down" && currentGear == 1 {
            print("That's not possible")
        }
    }
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
        self.currentGear = 1
    }
}

var fit = Car(model: "Honda Fit", seats: 5)

fit.changeGears(upOrDown: "down")
