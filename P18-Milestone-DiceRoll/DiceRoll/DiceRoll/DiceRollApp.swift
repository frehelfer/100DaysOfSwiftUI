//
//  DiceRollApp.swift
//  DiceRoll
//
//  Created by Frédéric Helfer on 21/11/22.
//

import SwiftUI

@main
struct DiceRollApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
