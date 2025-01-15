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
    case addSession(Activity)
}

struct ContentView: View {
    @State private var activities = Activities(list: [Activity]())
    @State private var navigationPath: [NavigationDestination] = []
    @State var activity : Activity? = nil

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
                .onDelete(perform: removeActivity)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button(action: {
                    navigationPath.append(.addActivity)
                }) {
                    Label("Add activity", systemImage: "plus")
                }
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .activity(let selectedActivity):
                    if let index = activities.list.firstIndex(where: { $0.id == selectedActivity.id }) {
                        ActivityDetailView(activity: $activities.list[index], navigationPath: $navigationPath)
                    }
                case .addActivity:
                    AddActivityView(activities: activities)
                case .addSession(let selectedActivity):
                    if let index = activities.list.firstIndex(where: { $0.id == selectedActivity.id }) {
                        AddSessionView(activity: $activities.list[index])
                            .onAppear {
                                activity = selectedActivity
                            }
                    }
                }
            }
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        activities.list.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
