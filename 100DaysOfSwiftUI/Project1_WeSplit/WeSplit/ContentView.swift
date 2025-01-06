//
//  ContentView.swift
//  WeSplit
//
//  Created by HUA Cindy on 03/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = 0..<101
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) + 2
        let tipSelection = Double(tipPercentage)
        return (1 + tipSelection / 100) * checkAmount / peopleCount
    }
    
    var totalForCheck: Double {
        let tipSelection = Double(tipPercentage)
        return (1 + tipSelection / 100) * checkAmount
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to tip") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                Section("Total amount for check") {
                    Text(totalForCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .foregroundColor(tipPercentage == 0 ? .red : .primary)
                
                Section("Amout per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
