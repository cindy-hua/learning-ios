//
//  ContentView.swift
//  Project18_LayoutAndGeometry
//
//  Created by HUA Cindy on 19/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        let fadeStart = 200.0
                        let opacity = min(1, max(0, (minY - fadeStart) / 200))
                        
                        let scaleFactor = max(0.5, min(1, (minY / fullView.size.height) * 1.5))
                        
                        let hue = max(0, min(1, minY / fullView.size.height))
                        let dynamicColor = Color(hue: hue, saturation: 1, brightness: 1)
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(dynamicColor)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(scaleFactor)
                            .opacity(opacity)
                            .animation(.easeInOut(duration: 0.3), value: scaleFactor)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
