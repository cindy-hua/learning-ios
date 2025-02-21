//
//  ContentView.swift
//  Project19_SnowSeeker
//
//  Created by HUA Cindy on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .defaultOrder

    enum SortOrder {
        case defaultOrder, alphabetical, country
    }
    
    var sortedResorts: [Resort] {
        let filtered = searchText.isEmpty ? resorts : resorts.filter { $0.name.localizedStandardContains(searchText) }
        
        switch sortOrder {
        case .defaultOrder:
            return filtered
        case .alphabetical:
            return filtered.sorted { $0.name < $1.name }
        case .country:
            return filtered.sorted { $0.country < $1.country }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Default").tag(SortOrder.defaultOrder)
                        Text("Alphabetical").tag(SortOrder.alphabetical)
                        Text("By Country").tag(SortOrder.country)
                    }
                    .pickerStyle(.menu)
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
