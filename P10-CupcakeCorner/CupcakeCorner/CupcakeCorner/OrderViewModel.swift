//
//  OrderViewModel.swift
//  CupcakeCorner
//
//  Created by Frédéric Helfer on 19/10/22.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: OrderModel
        
    init() {
        order = OrderModel(type: 0, quantity: 3, extraFrosting: false, addSprinkles: false, name: "", streetAddress: "", city: "", zip: "")
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var specialRequestEnabled: Bool = false {
        didSet {
            if specialRequestEnabled == false {
                order.extraFrosting = false
                order.addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if order.name.isReallyEmpty ||
            order.streetAddress.isReallyEmpty ||
            order.city.isReallyEmpty ||
            order.zip.isReallyEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(order.quantity) * 2

        // complicated cakes cost more
        cost += (Double(order.type) / 2)

        // $1/cake for extra frosting
        if order.extraFrosting {
            cost += Double(order.quantity)
        }

        // $0.50/cake for sprinkles
        if order.addSprinkles {
            cost += Double(order.quantity) / 2
        }

        return cost
    }
}
