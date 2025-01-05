//
//  ContentView.swift
//  Milestone1-3_RockPaperScissors
//
//  Created by HUA Cindy on 05/01/2025.
//

import SwiftUI

let moves = ["rock", "paper", "scissors"]

struct MoveImage: View {
    var move : String
    
    var body: some View {
        Image(move)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .shadow(radius: 5.0)
    }
}

struct ContentView: View {
    @State var appMove : String = moves[Int.random(in: 0...2)]
    @State var shouldWin : Bool = Bool.random()
    @State var playerScore = 0
    @State var playerMove = ""
    
    var correctMove : String {
        if appMove == "rock" {
            return shouldWin ? "paper" : "scissors"
        } else if appMove == "paper" {
            return shouldWin ? "scissors" : "rock"
        } else {
            return shouldWin ? "rock" : "paper"
        }
    }
    
    @State var scoreTitle = ""
    @State var showingScore = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 150/255, green: 190/255, blue: 220/255),
                Color(red: 460/255, green: 150/255, blue: 190/255)
            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("App's Move")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                MoveImage(move: appMove)
                HStack {
                    Text("You should:")
                        .foregroundStyle(.secondary)
                        .font(.title)
                    Text(shouldWin ? "Win" : "Lose")
                        .foregroundStyle(shouldWin ? .green : .red)
                        .font(.title)
                        .bold()
                }
                
                Spacer()
                
                Text("Your Move")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                HStack(alignment: .bottom) {
                    ForEach(0..<3) { number in
                        Button {
                            moveTapped(number)
                        } label: {
                            MoveImage(move: moves[number])
                        }
                    }
                }
                .padding()
                
                Text("Your score: \(playerScore)")
                    .foregroundStyle(.secondary)
                    .font(.title2)
                
                Spacer()
                Button("Restart", action: restart)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.white) // Fond blanc
                    .foregroundColor(.cyan) // Texte bleu
                    .cornerRadius(25) // Coins arrondis
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5) // Ombre
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        }
    }
    
    func moveTapped(_ number: Int) {
        playerMove = moves[number]
        if playerMove == correctMove {
            playerScore += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func newQuestion() {
        shouldWin.toggle()
        appMove = moves[Int.random(in: 0...2)]
    }
    
    func restart() {
        newQuestion()
        playerScore = 0
    }
}

#Preview {
    ContentView()
}
