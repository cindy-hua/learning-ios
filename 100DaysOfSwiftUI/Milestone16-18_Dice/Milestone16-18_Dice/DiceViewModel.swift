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
}
