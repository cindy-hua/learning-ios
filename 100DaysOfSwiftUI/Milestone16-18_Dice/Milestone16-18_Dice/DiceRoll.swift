//
//  DiceRoll.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import Foundation

struct DiceRoll: Identifiable, Codable {
    var id = UUID()
    var diceType: Int
    var diceCount: Int
    var results: [Int] = []
    var total: Int = 0
    
    init(diceType: Int, diceCount: Int, isTemporary: Bool = false) {
        self.diceType = diceType
        self.diceCount = diceCount

        if isTemporary {
            self.results = Array(repeating: 1, count: diceCount)
        }
    }
    
    mutating func rollDice() {
        results = (0..<diceCount).map { _ in Int.random(in: 1...diceType) }
        total = results.reduce(0, +)
    }
}
