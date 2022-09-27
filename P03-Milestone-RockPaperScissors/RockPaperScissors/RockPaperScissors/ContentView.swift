//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Frédéric Helfer on 27/09/22.
//

import SwiftUI

struct ContentView: View {
    
    let options = ["👊", "✋", "✌️"]
    
    @State private var appChoise = Int.random(in: 0..<3)
    @State private var shouldWin = false
    
    @State private var score = 0
    @State private var round = 0
    @State private var scoreAlert = false
    
    
    
    var body: some View {
        ZStack {
//            Color.teal
//                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("Computer has played...")
                    .font(.title)
                
                Text(options[appChoise])
                    .font(.system(size: 200))
                
                if shouldWin {
                    Text("Which one wins?")
                        .font(.title3)
                        .foregroundColor(.green)
                } else {
                    Text("Which one loses?")
                        .font(.title3)
                        .foregroundColor(.red)
                }
                
                HStack {
                    ForEach(0..<3) { number in
                        Button(options[number]) {
                            game(number)
                        }
                            .font(.system(size: 80))
                    }
                }
                
                Spacer()
                
                Text("score: \(score)")
                
                Spacer()
                
            }
        }
        .alert("Game Over", isPresented: $scoreAlert) {
            Button("Play Again", action: restartGame)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func game(_ number: Int) {
        let winningMoves = [1, 2, 0]
        var didWin: Bool

        if shouldWin {
            didWin = number == winningMoves[appChoise]
        } else {
            didWin = winningMoves[number] == appChoise
        }
        
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if round == 10 {
            scoreAlert = true
        } else {
            round += 1
            appChoise = Int.random(in: 0..<3)
            shouldWin.toggle()
        }
    }
    
    func restartGame() {
        score = 0
        round = 0
        appChoise = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
