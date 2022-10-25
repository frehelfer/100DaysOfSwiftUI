//
//  UserView.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        List {
            Section("User Info") {
                HStack {
                    Text("Name:").bold()
                    Text(user.name)
                }
                HStack {
                    Text("Age:").bold()
                    Text(String(user.age))
                }
                HStack {
                    Text("Email:").bold()
                    Text(user.email)
                }
                HStack {
                    Text("Company:").bold()
                    Text(user.company)
                }
                HStack {
                    Text("Address:").bold()
                    Text(user.address)
                }
                HStack {
                    Text("Registered:").bold()
                    Text(user.registered.formatted(date: .numeric, time: .omitted))
                }
            }
                        
            Section("About") {
                Text(user.about)
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
    }
}


//
//
//struct User: Identifiable, Codable {
//    var id: String
//    var isActive: Bool
//
//    var name: String
//    var age: Int
//    var company: String
//    var email: String
//    var address: String
//    var about: String
//
//    var registered: Date
//
//    var tags: [String]
//    var friends: [Friend]
//
//    struct Friend: Identifiable, Codable {
//        var id: String
//        var name: String
//    }
//}
