//
//  ContentView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 30/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = true   // ou pedindo settings, nr tabuada e nr de pereguntas
    
    @State private var multTable = 1
    @State private var correctAnswer = 0
    @State private var question = 0
    
    @State private var score = 0
    @State private var round = 0
    
    @State private var nQuestions = 5
    @State private var choseQuestions = [5, 10, 20]
    @State private var questions: [Int] = []
    
//    private var btnsResponses = generateUniqueRandomNumbers(repetitions: 3, maxValue: 144, shouldInclude: correctAnswer)
    
    
    @State private var showingScore = false
    @State private var scoreTitle = "Your score was:"
    
    func generateUniqueRandomNumbers(repetitions: Int, maxValue: Int, shouldInclude: Int) -> [Int] {
        var numbers: [Int] = []
        numbers.append(shouldInclude)
        
        guard maxValue >= repetitions else {
            fatalError("maxValue must be >= repetitions")
        }
        
        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = Int.random(in: 1..<maxValue)
            } while numbers.contains(n)
            numbers.append(n)
        }
        
        return numbers
    }
    
    
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Seleção do multTable e nQuestions
                Stepper("Enter the Multiplication Table", value: $multTable, in: 1...12)
                
                Picker("Number of Questions", selection: $nQuestions){
                    ForEach(choseQuestions, id:\.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                // Pergunta
                Text("\(multTable) x \(questions[round]) = ?")
                
                Spacer()
            
                //Botoes
                HStack {
                    ForEach(0..<4) { number in
                        Button {
                            game(number)
                        } label: {
                            Text(String(number))
                        }
                        .frame(width: 60, height: 60)
                        .background(.thinMaterial)
                        .foregroundColor(.primary)
                    }
                }
                
                Spacer()
            }
        }
        .onAppear()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Restart", action: settings) // Talvez trocar de settings para restart?
        } message: {
            Text("\(score)")
        }
    }
    
    func game(_ number: Int) {
        
        correctAnswer = multTable * questions[round]

        if number == correctAnswer { // TODO: como achar o valor do btn
            score += 1
        }

        round += 1

        if round == nQuestions {
             showScore()
        } else {
            nextQuestion()
        }
    }
    
    func nextQuestion() {
//        correctAnswer = multTable * questions[round]
//        question = questions[round]
        
    }
    
    func showScore() {
        showingScore = true
    }
    
    
    func settings() {
        score = 0
        round = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
