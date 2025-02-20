//
//  ContentView.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import SwiftUI



struct ContentView: View {
    @State private var viewModel = DiceViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Dice type", selection: $viewModel.diceType) {
                    ForEach(viewModel.diceOptions, id: \.self) { dice in
                        Text("\(dice)")
                    }
                }
                .pickerStyle(.segmented)
                
                Stepper("Number of Dice: \(viewModel.diceCount)", value: $viewModel.diceCount, in: 1...10)
                
                Button("Roll Dice") {
                    var newRoll = DiceRoll(diceType: viewModel.diceType, diceCount: viewModel.diceCount)
                    newRoll.rollDice()
                    print(newRoll.results)
                    viewModel.rollHistory.append(newRoll)
                
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                ForEach(viewModel.rollHistory.first?.results ?? [], id: \.self) { result in
                        AnimatedDiceView(finalValue: .constant(result), diceType: viewModel.diceType)
                    }
                
                RollHistoryView(rollHistory: $viewModel.rollHistory)
            }
            .padding()
        }
    }
    
}

#Preview {
    ContentView()
}
