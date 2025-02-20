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
    
    mutating func rollDice() {
        results = (0..<diceCount).map { _ in Int.random(in: 1...diceType)}
        total = results.reduce(0, +)
    }
}
