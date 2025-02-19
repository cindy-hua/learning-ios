//
//  ContentView.swift
//  Milestone13-15_PhotoCollection
//
//  Created by HUA Cindy on 13/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var showingAddImage = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items.sorted(), id: \.id) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        HStack {
                            item.image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Photo Collection")
            .toolbar {
                Button {showingAddImage.toggle()
                } label: {
                    Label("Add image", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddImage, content: {
                AddImageView(viewModel: $viewModel)
            })
        }
    }
}

#Preview {
    ContentView()
}
