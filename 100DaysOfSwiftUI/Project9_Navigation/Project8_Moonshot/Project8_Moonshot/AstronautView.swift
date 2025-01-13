//
//  AstronautView.swift
//  Project8_Moonshot
//
//  Created by HUA Cindy on 12/01/2025.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let astronaut = astronauts["aldrin"]!
    
    return AstronautView(astronaut: astronaut)
        .preferredColorScheme(.dark)
}
