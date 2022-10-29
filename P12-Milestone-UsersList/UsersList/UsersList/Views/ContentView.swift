//
//  ContentView.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserView(user: user)
                    } label: {
                        HStack(spacing: 12) {
                            Circle()
                                .fill(user.isActive ? .green : .gray.opacity(0.5))
                                .frame(width: 14, height: 14)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(user.wrappedName)
                                
                                Text(user.wrappedEmail)
                                    .foregroundColor(.gray.opacity(0.7))
                            }
                        }
                        .padding(5)
                    }
                }
            }
            .navigationTitle("Users List")
        }
        .task {
            await getData()
        }
    }
    
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)
            
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            cachedUser.tags = user.tags.joined(separator: ",")
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                
                cachedUser.addToFriends(cachedFriend)
            }
        }
        
        try? moc.save()
    }
    
    func getData() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedData = try decoder.decode([User].self, from: data)
            
            await MainActor.run {
                updateCache(with: decodedData)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
