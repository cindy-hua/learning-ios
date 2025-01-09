//
//  ContentView.swift
//  Milestone4-6_TableLearner
//
//  Created by HUA Cindy on 09/01/2025.
//

import SwiftUI

enum Constants {
    static let wrongText = "Wrong"
    static let correctText = "Correct"
    
    static func finalScoreTeller(score: Int, numberQuestion: Int) -> String {
        "Congratulation! Your final score is \(score)/\(numberQuestion)"
    }
}

struct ContentView: View {
    @State private var upTo: Int = 2
    @State private var temporaryUpTo: Int = 2
    
    @State private var temporaryNumberQuestion: Int = 5
    @State private var numberQuestion: Int = 5
    @State private var questionChoices = [5, 10, 20]
    
    @State private var firstInt : Int = 1
    @State private var secondInt : Int = 1
    
    @State private var temporaryAnswer : String = ""
    @State private var answer: Int = 0
    
    @State private var score = 0
    @State private var gameNumber = 1
    
    @State private var showingResult = false
    @State private var resultText = ""
    
    @State private var showingFinalResult = false
    
    var body: some View {
        VStack {
            Stepper("Up to table \(temporaryUpTo)", value: $temporaryUpTo, in: 2...12)
            
            Picker("Number of questions", selection: $temporaryNumberQuestion) {
                ForEach(questionChoices, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button {
                startGame()
            } label: {
                Text("Start game")
            }
            
            Text("Game \(gameNumber) / \(numberQuestion) up to table \(upTo)")
            
            Text("\(firstInt) x \(secondInt)")
            
            TextField("Answer", text: $temporaryAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Validate") {
                if let validatedAnswer = Int(temporaryAnswer) {
                    answer = validatedAnswer
                    enterAnswer()
                }
            }
            
            Text("\(score)")
        }
        .alert(resultText, isPresented: $showingResult) {}
        .alert("End of Game", isPresented: $showingFinalResult) {
            Button("Restart") {startGame()}
        } message: {
            Text(Constants.finalScoreTeller(score: score, numberQuestion: numberQuestion))
        }
    }
    
    func startGame() {
        numberQuestion = temporaryNumberQuestion
        upTo = temporaryUpTo
        newQuestion()
        score = 0
    }
    
    func enterAnswer(){
        if answer == firstInt*secondInt {
            score += 1
            resultText = Constants.correctText
        } else {
            resultText = Constants.wrongText
        }
        showingResult = true
        if gameNumber == numberQuestion {
            showingFinalResult = true
        } else {
            newQuestion()
        }
    }
    
    func newQuestion(){
        temporaryAnswer = ""
        firstInt = Int.random(in: 1...upTo)
        secondInt = Int.random(in: 1...upTo)
        gameNumber += 1
    }
}

#Preview {
    ContentView()
}
