//
//  ContentView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 30/09/22.
//

import SwiftUI

//You should randomly generate as many questions as they asked for, within the difficulty range they asked for.

struct ContentView: View {
    @State private var game = Game()
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("Table of: \(game.multiplicationTable)", value: $game.multiplicationTable, in: 2...12)
                
                Picker(selection: $game.numberOfQuestions) {
                    ForEach(game.chooseQuestions, id: \.self) {
                        Text(String($0))
                    }
                } label: {
                    Text("Number of Questions")
                }
                
                NavigationLink {
                    GameView(game: $game)
                } label: {
                    Text("Start")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.purple)
                        .cornerRadius(25)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(.black, lineWidth: 1)
                        )
                }
            }
            .navigationTitle("iTabuada")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
