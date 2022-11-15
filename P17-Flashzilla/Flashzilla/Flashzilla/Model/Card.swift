//
//  Card.swift
//  Flashzilla
//
//  Created by Frédéric Helfer on 14/11/22.
//

import Foundation

struct Card: Codable, Identifiable, Equatable {
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodia Whittaker")
}
