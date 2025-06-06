//
//  ContentView.swift
//  Project2_GuessTheFlag
//
//  Created by HUA Cindy on 03/01/2025.
//

import SwiftUI

// Code for Project 4
struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in:0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var actualScore = 0
    @State private var selectedCountry = "Estonia"
    
    @State private var numberOfGame = 1
    
    @State private var endGame = false
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top,startRadius: 100, endRadius: 900)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Text("Number of game: \(numberOfGame) / 8")
                    .font(.title2)
                    .foregroundStyle(.white)
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
//                            Old code for Project 2
//                            Image(countries[number])
//                                .clipShape(.capsule)
//                                .shadow(radius: 5)
                            
//                            Code for Project 4
                            FlagImage(country: countries[number])
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(actualScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            (scoreTitle == "Correct") ? Text("That's correct!") : Text("You're wrong! That is \(selectedCountry)'s flag.")
        }
        .alert("End of game!", isPresented: $endGame) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Game ended. Your final score is \(actualScore)/8.")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            actualScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
        selectedCountry = countries[number]
        if numberOfGame == 8 {
            endGame = true
        } else {
            numberOfGame += 1
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        numberOfGame = 1
        actualScore = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
