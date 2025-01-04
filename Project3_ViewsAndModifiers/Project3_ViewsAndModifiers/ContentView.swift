//
//  ContentView.swift
//  Project4_ViewsAndModifiers
//
//  Created by HUA Cindy on 04/01/2025.
//

// Exercise 1 and 2 about the modification of Projects 1 and 2 are directly modified in the corresponded project folders.

import SwiftUI

struct ExerciseModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func exerciceModifier() -> some View {
        modifier(ExerciseModifier())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .exerciceModifier()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
