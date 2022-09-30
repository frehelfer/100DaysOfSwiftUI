//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Frédéric Helfer on 24/09/22.
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var timesPlayed = 0
    
    @State private var countries = allCountries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    @State private var animationAmount = 0.0
    @State private var selectedBtn = -1
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.blue, .mint, .yellow, .init(red: 0.6, green: 0.2, blue: 0.7), .init(red: 0.1, green: 0.2, blue: 0.5)]), center: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            game(number)
                            
                        } label: {
                            FlagImage(name: countries[number])
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 3)
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding(23)
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score is \(score) from 8")
        }
    }
    
    func game(_ number: Int) {

        if number == correctAnswer {
            score += 1
            animationAmount += 360
        }
        timesPlayed += 1
        
        if timesPlayed == 8 {
            showingScore = true
        }
        askQuestion()
    }
    
//    func flagTapped(_ number: Int) {
//        if number == correctAnswer {
//            scoreTitle = "Correct"
//            score += 1
//        } else {
//            scoreTitle = "Wrong! That's the flag of \(countries[number])"
//            score = 0
//        }
//
//        showingScore = true
//    }
    
    func askQuestion() {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedBtn = -1
    }
    
    func reset() {
        countries = Self.allCountries
        timesPlayed = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
