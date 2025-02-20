//
//  ContentView.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import SwiftUI

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

struct ContentView: View {
    @State private var diceType: Int = 6
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    @State private var diceCount: Int = 1
    @State private var rollHistory = [DiceRoll]() {
        didSet {
            saveHistory()
        }
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
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Dice type", selection: $diceType) {
                    ForEach(diceOptions, id: \.self) { dice in
                        Text("\(dice)")
                    }
                }
                .pickerStyle(.segmented)
                
                Stepper("Number of Dice: \(diceCount)", value: $diceCount, in: 1...10)
                
                Button("Roll Dice") {
                    var newRoll = DiceRoll(diceType: diceType, diceCount: diceCount)
                    newRoll.rollDice()
                    print(newRoll.results)
                    rollHistory.append(newRoll)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                List(rollHistory) { roll in
                    HStack {
                        Text("Rolled \(roll.diceCount) d\(roll.diceType)")
                            .font(.headline)
                        Text("Results: \(roll.results.map(String.init).joined(separator: ", "))")
                    }
                }
            }
            .padding()
            .onAppear(perform: {
                loadHistory()
            })
        }
    }
    
}

#Preview {
    ContentView()
}
