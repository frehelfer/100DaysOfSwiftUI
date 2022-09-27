//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Frédéric Helfer on 26/09/22.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Custom ViewModifier")
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
