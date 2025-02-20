//
//  RollDiceView.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import SwiftUI

struct RollDiceView: View {
    @Binding var viewModel: DiceViewModel
    let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        VStack {
            Picker("Dice type", selection: $viewModel.diceType) {
                ForEach(viewModel.diceOptions, id: \.self) { dice in
                    Text("d\(dice)")
                }
            }
            .pickerStyle(.segmented)

            Stepper("Number of Dice: \(viewModel.diceCount)", value: $viewModel.diceCount, in: 1...10)

            Button("Roll Dice") {
                viewModel.rollDice()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            if let lastRoll = viewModel.rollHistory.first {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(Array(lastRoll.results.enumerated()), id: \.0) { index, _ in
                            if index < lastRoll.results.count {
                                AnimatedDiceView(
                                    isRolling: viewModel.isRolling,
                                    value: $viewModel.rollHistory[0].results[index], 
                                    maxValue: viewModel.diceType
                                )
                            }
                        }
                    }
                    .padding()
                }
            } else {
                Text("Roll the dice to see results!")
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Roll Dice")
    }
}


#Preview {
    @State var viewModel = DiceViewModel()
    return RollDiceView(viewModel: $viewModel)
}
