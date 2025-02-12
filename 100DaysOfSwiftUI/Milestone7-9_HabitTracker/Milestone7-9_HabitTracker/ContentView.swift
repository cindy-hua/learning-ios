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

let focusOrange = Color(red: 1.0, green: 0.58, blue: 0.0).opacity(0.8)

struct Background: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [focusOrange, .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}


struct GlassBox: ViewModifier {
    func body(content:Content) -> some View {
        content
            .listRowBackground(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(white: 1, opacity: 0.5))
                    .padding(.vertical, 2).padding(.horizontal, 5)
            )
    }
}

struct ContentView: View {
    @State private var activities = Activities(list: [Activity]())
    @State private var navigationPath: [NavigationDestination] = []
    @State var activity : Activity? = nil

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Background()
                List {
                    ForEach(activities.list) { activity in
                        NavigationLink(value: NavigationDestination.activity(activity)) {
                            VStack(alignment: .leading) {
                                Text(activity.name).font(.headline)
                                Text(activity.description).font(.subheadline)
                            }
                        }
                    }
                    .modifier(GlassBox())
                    .onDelete(perform: removeActivity)
                }
                .scrollContentBackground(.hidden)
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
    }
    
    func removeActivity(at offsets: IndexSet) {
        activities.list.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
