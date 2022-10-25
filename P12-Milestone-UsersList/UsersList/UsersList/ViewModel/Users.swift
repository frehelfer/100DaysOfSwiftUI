//
//  Users.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import Foundation

@MainActor
class Users: ObservableObject {
    @Published var users: [User] = []
    
    
    
    func getData() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedData = try decoder.decode([User].self, from: data)
            users = decodedData
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
