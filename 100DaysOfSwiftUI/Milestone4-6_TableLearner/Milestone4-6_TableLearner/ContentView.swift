//
//  ContentView.swift
//  Milestone4-6_TableLearner
//
//  Created by HUA Cindy on 09/01/2025.
//

import SwiftUI

struct BigBlock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white.opacity(0.6))
            .cornerRadius(15)
    }
}

struct Operation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.cyan)
            .bold()
    }
}

struct Instruction: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
    }
}

struct BeautifulButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered)
            .tint(.orange)
            .padding(.vertical, 5)
    }
}

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
    let questionChoices = [5, 10, 20]
    
    @State private var firstInt : Int = 1
    @State private var secondInt : Int = 1
    
    @State private var temporaryAnswer : String = ""
    @State private var answer: Int = 0
    
    @State private var score = 0
    @State private var gameNumber = 1
    
    @State private var showingResult = false
    @State private var resultText = ""
    
    @State private var showingFinalResult = false
    
    @State private var allAnimals: [String] = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile",
        "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey",
        "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth",
        "snake", "walrus", "whale", "zebra"]
    
    @State private var animals: [String] = []
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
    
    enum AnimalStates {
        case win, lose, neither
    }
    
    @State private var animalState: [String: AnimalStates] = [:]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .yellow], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Spacer()
                    
                    Text("Collect the Animals!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Text("Answer the math questions and create your animal farm")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack {
                        VStack {
                            Text("I want to learn to")
                                .modifier(Instruction())
                            Text("\(temporaryUpTo) x \(temporaryUpTo)")
                                .modifier(Operation())
                            Stepper("Up to table \(temporaryUpTo)", value: $temporaryUpTo, in: 2...12)
                                .labelsHidden()
                        }
                        .padding()
                        
                        VStack {
                            VStack {
                                Text("Number of questions")
                                    .multilineTextAlignment(.center)
                                    .modifier(Instruction())
                                
                                Picker("Number of questions", selection: $temporaryNumberQuestion) {
                                    ForEach(questionChoices, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                            
                            Button {
                                startGame()
                            } label: {
                                Text("Let's start")
                            }
                            .modifier(BeautifulButton())
                        }
                        .padding()
                    }
                    .modifier(BigBlock())
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("Game \(gameNumber) / \(numberQuestion)")
                            .modifier(Instruction())
                        
                        Text("\(firstInt) x \(secondInt)")
                            .modifier(Operation())
                        
                        TextField("Answer", text: $temporaryAnswer)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Validate") {
                            if let validatedAnswer = Int(temporaryAnswer) {
                                answer = validatedAnswer
                                enterAnswer()
                            }
                        }
                        .modifier(BeautifulButton())
                    }
                    .modifier(BigBlock())
                    
                    Spacer()
                    
                    Text("Your score is: \(score)")
                        .modifier(BigBlock())
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(animals, id: \.self) { animal in
                            Image(animal)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .scaleEffect(valueWinLoseNeither(state: animalState[animal] ?? .neither, winValue: 1.0, loseValue: 1.0, neitherValue: 0.5))
                                .animation(.interpolatingSpring(stiffness: 50, damping: 5), value: animalState[animal])
                                .opacity(valueWinLoseNeither(state: animalState[animal] ?? .neither, winValue: 1.0, loseValue: 0.3, neitherValue: 0.3))
                                .saturation(valueWinLoseNeither(state: animalState[animal] ?? .neither, winValue: 1.0, loseValue: 0.0, neitherValue: 0.3))
                                .animation(.easeOut(duration: 0.3), value: animalState[animal])
                                .rotationEffect(.degrees(valueWinLoseNeither(state: animalState[animal] ?? .neither, winValue: 360, loseValue: 0, neitherValue: 0)))
                                .animation(.interpolatingSpring(stiffness: 50, damping: 5), value: animalState[animal])
                                .shadow(radius: 5)
                                .onTapGesture {
                                    // fun actions to come
                                }
                        }
                    }
                }
                .alert(resultText, isPresented: $showingResult) {}
                .alert("End of Game", isPresented: $showingFinalResult) {
                    Button("Restart") {startGame()}
                } message: {
                    Text(Constants.finalScoreTeller(score: score, numberQuestion: numberQuestion))
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    func startGame() {
        numberQuestion = temporaryNumberQuestion
        upTo = temporaryUpTo
        newQuestion()
        score = 0
        gameNumber = 1
        animals = Array(allAnimals[0..<numberQuestion]).shuffled()
        allAnimals.forEach { animal in animalState[animal] = .neither }
    }
    
    func enterAnswer(){
        if answer == firstInt*secondInt {
            score += 1
            resultText = Constants.correctText
            animalState[animals[gameNumber - 1]] = .win
        } else {
            resultText = Constants.wrongText
            animalState[animals[gameNumber - 1]] = .lose
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
    
    func valueWinLoseNeither(state: AnimalStates, winValue: Double, loseValue: Double, neitherValue: Double) -> Double {
        switch state {
        case .win : return winValue
        case .lose : return loseValue
        case .neither : return neitherValue
        }
    }
}

#Preview {
    ContentView()
}
