//
//  ContentView.swift
//  Landmarks
//
//  Created by HUA Cindy on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .environment(ModelData())
    }
}

#Preview {
    ContentView()
}
