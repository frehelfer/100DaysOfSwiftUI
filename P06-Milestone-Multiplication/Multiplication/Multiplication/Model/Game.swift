//
//  Game.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 08/10/22.
//

import Foundation

struct Game {
    var multiplicationTable = 1
    var numberOfQuestions = 5
    var chooseQuestions = [5, 10, 20]
    
    var questions: [Int] = [0]
    var answers: [Int] = [0, 0, 0, 0]
    var correctAnswer = 0
    var currentQuestion = 0
    
    var isRight = false
    
    var score = 0
    var round = 0
    
    var showingScore = false
    
    mutating func start() {
        reset()
        
        questions = generateUniqueRandomNumbers(repetitions: (numberOfQuestions + 1), maxValue: 12, notUnique: numberOfQuestions > 12 ? true : false)
        correctAnswer = multiplicationTable * questions[round]
        answers = generateAnswers(correctAnswer: correctAnswer)
        currentQuestion = questions[round]
        
        print(questions)
        print(correctAnswer)
        print(answers)
    }
    
    mutating func checkAnswer(btnNumber: Int) {
        if answers[btnNumber] == correctAnswer {
            score += 1
            isRight = true
        } else {
            isRight = false
        }
        
        round += 1
        
        if round == numberOfQuestions {
            showScore()
        } else {
            nextQuestion()
        }
    }
    
    mutating func showScore() {
        showingScore = true
    }
    
    mutating func nextQuestion() {
        correctAnswer = multiplicationTable * questions[round]
        answers = generateAnswers(correctAnswer: correctAnswer)
        currentQuestion = questions[round]
    }
    
    mutating func reset() {
        score = 0
        round = 0
    }
    
    func generateAnswers(correctAnswer: Int) -> [Int] {
        var numbers: [Int] = []
        numbers.append(correctAnswer)
        
        let minValue = correctAnswer <= 15 ? 1 : correctAnswer - 15
        let maxValue = correctAnswer + 15
        
        for _ in 0..<3 {
            var n: Int
            repeat {
                n = Int.random(in: minValue...maxValue)
            } while numbers.contains(n)
            numbers.append(n)
        }
        
        return numbers.shuffled()
    }
    
    func generateUniqueRandomNumbers(repetitions: Int, maxValue: Int, addNum: Int = 0, notUnique: Bool = false) -> [Int] {
        var numbers: [Int] = []

        if addNum != 0 {
            numbers.append(addNum)
        }

        guard maxValue >= repetitions || notUnique else {
            fatalError("maxValue must be >= repetitions")
        }

        for _ in 1...repetitions {
            var n: Int
            if notUnique {
                numbers.append(Int.random(in: 1..<maxValue))
            } else {
                repeat {
                    n = Int.random(in: 1..<maxValue)
                } while numbers.contains(n)
                numbers.append(n)
            }
        }

        return numbers
    }
}
