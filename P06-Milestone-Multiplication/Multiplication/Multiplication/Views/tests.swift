////
////  ContentView.swift
////  Multiplication
////
////  Created by Frédéric Helfer on 30/09/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var multTable = 1
//    @State private var correctAnswer = 0
//    @State private var question = 0
//    
//    @State private var score = 0
//    @State private var round = 0
//    
//    @State private var nQuestions = 5
//    @State private var choseQuestions = [5, 10, 20]
//    @State private var questions: [Int] = [0]
//    
//    @State private var answers: [Int] = [0, 0, 0, 0]
//    
//    
//    @State private var showingScore = false
//    @State private var scoreTitle = "Your score was:"
//
//    
//    var body: some View {
//        ZStack {
//            Color.mint.ignoresSafeArea()
//
//            VStack {
//            
//                
//                Button {
//                    start()
//                } label: {
//                    Text("Start game")
//                }
//                
//                Spacer()
//                Text("\(multTable) x \(questions[round]) = ?")
//                
//                Spacer()
//                HStack {
//                    ForEach(0..<4) { number in
//                        Button {
//                            game(number)
//                        } label: {
//                            Text(String(answers[number]))
//                        }
//                        .frame(width: 60, height: 60)
//                        .background(.thinMaterial)
//                        .foregroundColor(.primary)
//                    }
//                }
//                Spacer()
//                Text("Score: \(score)")
//            }
//        }
//        .alert(scoreTitle, isPresented: $showingScore) {
//            Button("Restart", action: settings) // Talvez trocar de settings para restart?
//        } message: {
//            Text("\(score)/\(nQuestions)")
//        }
//    }
//    
//    func game(_ number: Int) {
//        if answers[number] == correctAnswer { // TODO: como achar o valor do btn
//            score += 1
//        }
//
//        round += 1
//
//        if round == nQuestions {
//             showScore()
//        } else {
//            nextQuestion()
//        }
//    }
//    
//    func nextQuestion() {
//        correctAnswer = multTable * questions[round]
//        answers = generateUniqueRandomNumbers(repetitions: 3, maxValue: 144, addNum: correctAnswer).shuffled()
//        
//    }
//    
//    func showScore() {
//        showingScore = true
//    }
//    
//    
//    func settings() {
//        score = 0
//        round = 0
//    }
//    
//    func start() {
//        questions = generateUniqueRandomNumbers(repetitions: (nQuestions + 1), maxValue: 12, notUnique: nQuestions > 12 ? true : false)
//        correctAnswer = multTable * questions[round]
//        answers = generateUniqueRandomNumbers(repetitions: 3, maxValue: 144, addNum: correctAnswer).shuffled()
//        print(questions)
//        print(correctAnswer)
//        print(answers)
//    }
//    
//    func generateUniqueRandomNumbers(repetitions: Int, maxValue: Int, addNum: Int = 0, notUnique: Bool = false) -> [Int] {
//        var numbers: [Int] = []
//        
//        if addNum != 0 {
//            numbers.append(addNum)
//        }
//        
//        guard maxValue >= repetitions || notUnique else {
//            fatalError("maxValue must be >= repetitions")
//        }
//        
//        for _ in 1...repetitions {
//            var n: Int
//            if notUnique {
//                numbers.append(Int.random(in: 1..<maxValue))
//            } else {
//                repeat {
//                    n = Int.random(in: 1..<maxValue)
//                } while numbers.contains(n)
//                numbers.append(n)
//            }
//        }
//        
//        return numbers
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
