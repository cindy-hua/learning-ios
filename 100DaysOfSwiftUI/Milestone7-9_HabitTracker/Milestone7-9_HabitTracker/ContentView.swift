//
//  ContentView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI


enum NavigationDestination: Hashable {
    case activity(Activity)
    case addActivity
}

struct ContentView: View {
    @State private var activities = Activities(list: nil)
    @State private var navigationPath: [NavigationDestination] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(activities.list) { activity in
                    NavigationLink(value: NavigationDestination.activity(activity)) {
                        VStack(alignment: .leading) {
                            Text(activity.name).font(.headline)
                            Text(activity.description).font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button(action: {
                    navigationPath.append(.addActivity)
                    print(navigationPath)
                }) {
                    Label("Add activity", systemImage: "plus")
                }
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .activity(let activity):
                    ActivityDetailView(activity: activity)
                case .addActivity:
                    AddActivityView(activities: activities)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
