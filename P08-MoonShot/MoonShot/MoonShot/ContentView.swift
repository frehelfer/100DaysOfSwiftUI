//
//  ContentView.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 06/10/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let mission: [Mission] = Bundle.main.decode(file: "missions.json")
    
    @AppStorage("isList") private var isList = false
    
    var body: some View {
        NavigationView {
            Group {
                if isList {
                    ListLayout(astronauts: astronauts, mission: mission)
                } else {
                    GridLayout(astronauts: astronauts, mission: mission)
                }
            }
            .navigationTitle("Monnshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    isList.toggle()
                } label: {
                    if isList {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    } else {
                        Label("Show as table", systemImage: "list.dash")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
