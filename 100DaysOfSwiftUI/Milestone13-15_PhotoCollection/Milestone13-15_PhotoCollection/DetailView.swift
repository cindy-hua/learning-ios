//
//  DetailView.swift
//  Milestone13-15_PhotoCollection
//
//  Created by HUA Cindy on 13/02/2025.
//

import SwiftUI

struct DetailView: View {
    var item: Item
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(item.name)
                    .font(.title)
                item.image
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
    }
}

//#Preview {
//    DetailView()
//}
