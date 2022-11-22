////
////  DiceDataService.swift
////  DiceRoll
////
////  Created by Frédéric Helfer on 21/11/22.
////
//
//import Foundation
//
//class DiceDataService {
//    
//    @Published var dices: [Dice] = []
//    
//    private let databaseName = "dices_data"
//    
//    init() {
//        getDices()
//    }
//    
//    func addDice(diceAmount: Int, sideType: Int) {
//        let newDice = Dice(diceAmount: diceAmount, sideType: sideType)
//        dices.insert(newDice, at: 0)
//        saveDices()
//    }
//    
//    func getDices() {
//        let url = getURLForDiceData()
//        
//        if let data = try? Data(contentsOf: url) {
//            if let decoded = try? JSONDecoder().decode([Dice].self, from: data) {
//                dices = decoded
//            }
//        }
//    }
//    
//    func saveDices() {
//        let url = getURLForDiceData()
//        
//        if let data = try? JSONEncoder().encode(dices) {
//            try? data.write(to: url)
//        }
//    }
//    
//    private func getURLForDiceData() -> URL {
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return path[0].appendingPathComponent(databaseName, conformingTo: .database)
//    }
//}
