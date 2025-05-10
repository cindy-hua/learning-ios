//
//  RollHistoryView.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import SwiftUI

struct RollHistoryView: View {
    @Binding var rollHistory: [DiceRoll]
    
    var body: some View {
        List(rollHistory) { roll in
            HStack {
                Text("Rolled \(roll.diceCount) d\(roll.diceType)")
                    .font(.headline)
                Text("Results: \(roll.results.map(String.init).joined(separator: ", "))")
            }
        }
    }
}

#Preview {
    @State var rollHistory = [DiceRoll(diceType: 6, diceCount: 3), DiceRoll(diceType: 10, diceCount: 4)]
    return RollHistoryView(rollHistory: $rollHistory)
}
