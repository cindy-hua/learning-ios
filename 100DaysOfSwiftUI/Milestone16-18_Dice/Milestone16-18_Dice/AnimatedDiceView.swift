//
//  AnimatedDiceView.swift
//  Milestone16-18_Dice
//
//  Created by HUA Cindy on 20/02/2025.
//

import SwiftUI

struct AnimatedDiceView: View {
    var isRolling: Bool
    @Binding var value: Int
    var maxValue: Int

    @State private var animatedValue: Int = 1

    var body: some View {
        Text("\(animatedValue)")
            .font(.title)
            .padding()
            .frame(width: 75, height: 75)
            .background(Circle().fill(Color.blue.opacity(0.3)))
            .onChange(of: isRolling) { newValue in
                if newValue {
                    startRollingAnimation()
                } else {
                    animatedValue = value
                }
            }
    }

    func startRollingAnimation() {
        let animationDuration = 1.0
        let interval = 0.1
        var elapsedTime: Double = 0

        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            if elapsedTime < animationDuration {
                animatedValue = Int.random(in: 1...maxValue)
                elapsedTime += interval
            } else {
                timer.invalidate()
                animatedValue = value 
            }
        }

        RunLoop.main.add(timer, forMode: .common)
    }
}


#Preview {
    @State var value = 8
    return AnimatedDiceView(isRolling: true, value: $value, maxValue: 10)
}
