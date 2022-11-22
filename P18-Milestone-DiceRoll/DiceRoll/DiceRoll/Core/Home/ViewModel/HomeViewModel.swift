////
////  HomeViewModel.swift
////  DiceRoll
////
////  Created by Frédéric Helfer on 21/11/22.
////
//
//import Foundation
//import Combine
//
//class HomeViewModel: ObservableObject {
//    
//    @Published var dices: [Dice] = []
//    @Published var diceAmount = 1
//    @Published var sideAmount = 6
//    @Published var result = 0
//    
//    private let diceDataService = DiceDataService()
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        addSubscribers()
//    }
//    
//    func addSubscribers() {
//        diceDataService.$dices
//            .sink { [weak self] returnedDices in
//                self?.dices = returnedDices
//            }
//            .store(in: &cancellables)
//    }
//}
