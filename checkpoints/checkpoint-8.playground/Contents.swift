import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var stateAgentName: String { get set }
    func printSummary ()
}

extension Building {
    func printSummary() {
        print("Rooms: \(rooms)")
        print("Cost: $\(cost)")
        print("State Agent Name: \(stateAgentName)")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var stateAgentName: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var stateAgentName: String
}


let beachHouse = House(rooms: 4, cost: 600_000, stateAgentName: "Tom")
beachHouse.printSummary()

