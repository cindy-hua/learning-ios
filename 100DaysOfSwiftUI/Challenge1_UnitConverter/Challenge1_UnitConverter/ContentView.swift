//
//  ContentView.swift
//  Challenge1_UnitConverter
//
//  Created by HUA Cindy on 03/01/2025.
//

import SwiftUI



struct ContentView: View {
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Fahrenheit"
    @State private var inputValue: Double = 0.0
    @FocusState private var inputIsFocused: Bool
    
    enum TemperatureUnit: String, CaseIterable {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }
    
    let unitChoices = TemperatureUnit.allCases.map { $0.rawValue }
    
    var outputValue: Double {
        if inputUnit == "Celsius" {
            if outputUnit == "Celsius" {
                return inputValue
            } else if outputUnit == "Fahrenheit" {
                return inputValue * 9 / 5 + 32
            } else {
                return inputValue + 273.15
            }
        } else if inputUnit == "Fahrenheit" {
            if outputUnit == "Fahrenheit" {
                return inputValue
            } else if outputUnit == "Celsius" {
                return (inputValue - 32) * 5 / 9
            } else {
                return (inputValue - 32) * 5 / 9 + 273.15
            }
        } else {
            if outputUnit == "Kelvin" {
                return inputValue
            } else if outputUnit == "Celsius" {
                return inputValue - 273.15
            } else {
                return (inputValue - 273.15) * 9 / 5 + 32
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Unit") {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("What is your actual unit?", selection: $inputUnit){
                        ForEach(unitChoices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit") {
                    Text(outputValue, format: .number)
                    Picker("What is the unit you want?", selection: $outputUnit){
                        ForEach(unitChoices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
