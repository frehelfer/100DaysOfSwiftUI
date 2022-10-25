//
//  ContentView.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.users) { user in
                    NavigationLink {
                        UserView(user: user)
                    } label: {
                        HStack(spacing: 12) {
                            Circle()
                                .fill(user.isActive ? .green : .gray.opacity(0.5))
                                .frame(width: 14, height: 14)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(user.name)
                                
                                Text(user.email)
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
            await data.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
