//
//  ContentView.swift
//  Project9_Navigation
//
//  Created by HUA Cindy on 13/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
