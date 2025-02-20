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
        TabView {
            RollDiceView(viewModel: $viewModel)
                .tabItem {
                    Label("Roll Dice", systemImage: "die.face.6")
                }

            RollHistoryView(rollHistory: $viewModel.rollHistory)
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}

#Preview {
    ContentView()
}
