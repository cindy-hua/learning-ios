//
//  DiceViewModel.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import Foundation

@Observable
class DiceViewModel {
    var diceType: Int = 6
    var diceCount: Int = 1
    
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    
    var rollHistory = [DiceRoll]() {
        didSet {
            saveHistory()
        }
    }
    
    var isRolling: Bool = false
    
    init() {
            loadHistory()
        }
    
    func saveHistory() {
        if let encoded = try? JSONEncoder().encode(rollHistory) {
            UserDefaults.standard.set(encoded, forKey: "rollHistory")
        }
    }
    
    func loadHistory() {
        if let saveData = UserDefaults.standard.data(forKey: "rollHistory") {
            if let decodedHistory = try? JSONDecoder().decode([DiceRoll].self, from: saveData) {
                rollHistory = decodedHistory
            }
        }
    }
    
    func rollDice() {
        isRolling = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.isRolling = true
        }

        // 🔥 Toujours s'assurer que `results` a la bonne longueur
        var tempRoll = DiceRoll(diceType: diceType, diceCount: diceCount)
        tempRoll.results = Array(repeating: 1, count: diceCount)
        rollHistory.insert(tempRoll, at: 0)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            var newRoll = DiceRoll(diceType: self.diceType, diceCount: self.diceCount)
            newRoll.rollDice()

            if self.rollHistory.indices.contains(0) { 
                self.rollHistory[0] = newRoll
            }
            self.isRolling = false
        }
    }
}
