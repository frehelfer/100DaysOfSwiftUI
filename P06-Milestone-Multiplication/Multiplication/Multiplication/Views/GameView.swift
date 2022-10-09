//
//  GameView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 08/10/22.
//

import SwiftUI

struct GameView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            Text("\(game.multiplicationTable) x \(game.currentQuestion) = ?")
            
            HStack {
                ForEach(0..<4) { number in
                    Button {
                        game.checkAnswer(btnNumber: number)
                    } label: {
                        Text(String(game.answers[number]))
                            .frame(width: 60, height: 60)
                            .background(.purple)
                            .foregroundColor(.white)
                    }
                }
            }
            
            Text("Score: \(game.score)")
        }
        .onAppear {
            game.start()
        }
        .alert("Your score was:", isPresented: $game.showingScore) {
            NavigationLink("Reset") {
                ContentView()
            }
        } message: {
            Text("\(game.score)/\(game.numberOfQuestions)")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        GameView(game: game)
    }
}
