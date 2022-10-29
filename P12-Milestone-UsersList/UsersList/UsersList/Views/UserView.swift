//
//  UserView.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI

struct UserView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            Section("User Info") {
                HStack {
                    Text("Name:").bold()
                    Text(user.wrappedName)
                }
                HStack {
                    Text("Age:").bold()
                    Text(String(user.age))
                }
                HStack {
                    Text("Email:").bold()
                    Text(user.wrappedEmail)
                }
                HStack {
                    Text("Company:").bold()
                    Text(user.wrappedCompany)
                }
                HStack {
                    Text("Address:").bold()
                    Text(user.wrappedAddress)
                }
                HStack {
                    Text("Registered:").bold()
                    Text(user.wrappedRegistered.formatted(date: .numeric, time: .omitted))
                }
            }
                        
            Section("About") {
                Text(user.wrappedAbout)
            }
            
            Section("Friends") {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            }
        }
        .navigationTitle(user.wrappedName)
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
