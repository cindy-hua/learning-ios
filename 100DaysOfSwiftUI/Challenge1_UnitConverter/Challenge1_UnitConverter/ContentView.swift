//
//  ContentView.swift
//  Challenge1_UnitConverter
//
//  Created by HUA Cindy on 03/01/2025.
//

import SwiftUI

enum Constants {
    static let celsius = "Celsius"
    static let fahrenheit = "Fahrenheit"
    static let kelvin = "Kelvin"
}

struct ContentView: View {
    @State private var inputUnit: TemperatureUnit = .celsius
    @State private var outputUnit: TemperatureUnit = .fahrenheit
    @State private var inputValue: Double = 0.0
    @FocusState private var inputIsFocused: Bool
    
    enum TemperatureUnit: String, CaseIterable {
        case celsius
        case fahrenheit
        case kelvin
        
        var displayName: String {
            switch self {
            case .celsius: return Constants.celsius
            case .fahrenheit: return Constants.fahrenheit
            case .kelvin: return Constants.kelvin
            }
        }
    }
    
    let unitChoices = TemperatureUnit.allCases.map {$0}
    
//    var outputValue: Double {
//        if inputUnit == "Celsius" {
//            if outputUnit == "Celsius" {
//                return inputValue
//            } else if outputUnit == "Fahrenheit" {
//                return inputValue * 9 / 5 + 32
//            } else {
//                return inputValue + 273.15
//            }
//        } else if inputUnit == "Fahrenheit" {
//            if outputUnit == "Fahrenheit" {
//                return inputValue
//            } else if outputUnit == "Celsius" {
//                return (inputValue - 32) * 5 / 9
//            } else {
//                return (inputValue - 32) * 5 / 9 + 273.15
//            }
//        } else {
//            if outputUnit == "Kelvin" {
//                return inputValue
//            } else if outputUnit == "Celsius" {
//                return inputValue - 273.15
//            } else {
//                return (inputValue - 273.15) * 9 / 5 + 32
//            }
//        }
//    }
    
    var outputValue: Double {
        switch (inputUnit, outputUnit) {
        case (.celsius, .fahrenheit): return inputValue * 9 / 5 + 32
        case (.celsius, .kelvin): return inputValue + 273.15
        case (.fahrenheit, .celsius): return (inputValue - 32) * 5 / 9
        case (.fahrenheit, .kelvin): return (inputValue - 32) * 5 / 9 + 273.15
        case (.kelvin, .celsius): return inputValue - 273.15
        case (.kelvin, .fahrenheit): return (inputValue - 273.15) * 9 / 5 + 32
        default: return inputValue
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
                            Text($0.displayName)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit") {
                    Text(outputValue, format: .number)
                    Picker("What is the unit you want?", selection: $outputUnit){
                        ForEach(unitChoices, id: \.self) {
                            Text($0.displayName)
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
