//
//  User.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: UUID
    var isActive: Bool
    
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    
    var registered: Date
    
    var tags: [String]
    var friends: [Friend]
    
//    struct Friend: Identifiable, Codable {
//        var id: String
//        var name: String
//    }
}
