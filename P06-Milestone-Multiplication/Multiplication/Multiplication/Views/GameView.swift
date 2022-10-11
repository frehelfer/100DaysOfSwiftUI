//
//  GameView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 08/10/22.
//

import SwiftUI

struct GameView: View {
    @Binding var game: Game
    
    @State private var animationAmount = 0.0
    @State private var scaleAnimation = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.CustomBlue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                Image(systemName: game.isRight ? "checkmark" : "xmark")
                    .font(.system(size: 70))
                    .frame(width: 110, height: 110)
                    .background(game.isRight ? .CustomGreen : .CustomRed)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.black, lineWidth: 1)
                    )
                    .scaleEffect(scaleAnimation)
                    .animation(.easeInOut.speed(0.44), value: scaleAnimation)
                
                Text("\(game.multiplicationTable) x \(game.currentQuestion) = ?")
                    .font(.title)
                    .frame(width: 170, height: 90)
                    .background(.CustomYellow)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.black, lineWidth: 1)
                    )
                    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                    .padding(20)
                    
                Spacer()
                
                HStack {
                    ForEach(0..<4) { number in
                        Button {
                            game.checkAnswer(btnNumber: number)
                            withAnimation {
                                animationAmount += 360
                                scaleAnimation += 4
                            }
                            scaleAnimation -= 4
                        } label: {
                            Text(String(game.answers[number]))
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(width: 65, height: 65)
                                .background(.CustomGreen)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.black, lineWidth: 1)
                                )
                        }
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            game.start()
        }
        .alert("Your score is:", isPresented: $game.showingScore) {
            Button("Play again!") {
                dismiss()
            }
        } message: {
            Text("\(game.score)/\(game.numberOfQuestions)")
        }
        .navigationTitle("\(game.round)/\(game.numberOfQuestions)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GameView_Previews: PreviewProvider {
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        GameView(game: game)
    }
}
