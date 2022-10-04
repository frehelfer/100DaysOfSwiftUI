//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Frédéric Helfer on 03/10/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
