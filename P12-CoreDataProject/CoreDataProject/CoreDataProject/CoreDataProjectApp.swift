//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
