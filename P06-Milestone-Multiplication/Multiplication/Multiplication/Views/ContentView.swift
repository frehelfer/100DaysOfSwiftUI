//
//  ContentView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 30/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.CustomBlue
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    
                    Text("Multiplication Table")
                        .font(.title.bold())
                        .kerning(1)
                        .padding(.bottom, 30)
                    
                    HStack {
                        Text("Multiple of")
                            .frame(width: 130, height: 60)
                            .background(.CustomPink)
                        
                        Picker("Select multiplication table", selection: $game.multiplicationTable) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .accentColor(.black)
                        .frame(width: 60, height: 60)
                        .background(.CustomPurple)
                        .overlay(Rectangle()
                            .strokeBorder(.gray, lineWidth: 1)
                        )
                        
                    }
                    .background(.CustomPink)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.black, lineWidth: 1)
                    )
                    
                    
                    HStack {
                        Text("Number of questions")
                            .frame(width: 130, height: 60)
                            .background(.CustomPink)
                        
                        Picker("Select difficulty", selection: $game.numberOfQuestions) {
                            ForEach(game.chooseQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .accentColor(.black)
                        .frame(width: 60, height: 60)
                        .background(.CustomPurple)
                        .overlay(Rectangle()
                            .strokeBorder(.gray, lineWidth: 1)
                        )
                        
                    }
                    .background(.CustomPink)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.black, lineWidth: 1)
                    )
                    
                    Spacer()
                    
                    NavigationLink {
                        GameView(game: $game)
                    } label: {
                        Text("Play!")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(25)
                            .padding(.horizontal)
                            .background(.CustomGreen)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.black, lineWidth: 1)
                            )
                    }
                    Spacer()
                    Spacer()
                }
                .labelsHidden()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
