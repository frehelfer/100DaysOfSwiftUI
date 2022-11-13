//
//  ContentView.swift
//  Flashzilla
//
//  Created by Frédéric Helfer on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped!")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
