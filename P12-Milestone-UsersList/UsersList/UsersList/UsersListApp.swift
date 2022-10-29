//
//  UsersListApp.swift
//  UsersList
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI

@main
struct UsersListApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
