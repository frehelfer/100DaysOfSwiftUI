//
//  GameTests.swift
//  GameTests
//
//  Created by Frédéric Helfer on 08/10/22.
//

import XCTest
@testable import Multiplication

class MultiplicationTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testGenerateQuestions() {
        game.generateQuestions(of: 5)

    }

}
