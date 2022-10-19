//
//  OrderModel.swift
//  CupcakeCorner
//
//  Created by Frédéric Helfer on 19/10/22.
//

import Foundation

struct OrderModel: Codable {
//    var id = UUID()
    var type: Int
    var quantity: Int

    var extraFrosting: Bool
    var addSprinkles: Bool

    var name: String
    var streetAddress: String
    var city: String
    var zip: String
}
