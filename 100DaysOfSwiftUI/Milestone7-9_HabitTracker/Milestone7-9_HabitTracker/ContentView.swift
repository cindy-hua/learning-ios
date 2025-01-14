//
//  ContentView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

private var piano = Activity(name: "Piano", description: "I love that")
private var japanese = Activity(name: "Japanese", description: "This is hard")

struct ContentView: View {
//    @State private var activities = [Activity]()
    @State private var activities = Activities(list: [piano, japanese])
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(activities.list) { activity in
                    VStack {
                        Text(activity.name)
                        Text(activity.description)
                    }
                }
            }
        }
        .navigationTitle("Habit Tracker")
    }
}

#Preview {
    ContentView()
}
