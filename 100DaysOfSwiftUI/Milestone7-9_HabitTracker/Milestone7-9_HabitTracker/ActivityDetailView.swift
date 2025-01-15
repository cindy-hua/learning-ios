//
//  ActivityDetailView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

struct ActivityDetailView: View {
    @Binding var activity: Activity
    
    @Binding var navigationPath: [NavigationDestination]
    
    var body: some View {
        ZStack {
            Background()
            List{
                let groupedSessions = Dictionary(grouping: activity.sessions) { session in
                    Calendar.current.startOfDay(for: session.startTime)
                }
                let sortedDates = groupedSessions.keys.sorted(by: >)
                
                ForEach(sortedDates, id: \.self) { date in
                    Section(header: Text(date, format: .dateTime.day().month().year())) {
                        ForEach(groupedSessions[date] ?? []) {session in
                            HStack {
                                Text(session.startTime, format: .dateTime.hour().minute())
                                Text(session.endTime, format: .dateTime.hour().minute())
                            }
                        }
                    }
                }
                .onDelete(perform: removeSession)
                .modifier(GlassBox())
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("\(activity.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    navigationPath.append(.addSession(activity))
                }) {
                    Label("Add session", systemImage: "plus")
                }
            }
        }
    }
    
    func removeSession(at offsets: IndexSet) {
        activity.sessions.remove(atOffsets: offsets)
    }
}

#Preview {
    var piano = Activity(name: "Piano", description: "I love that")
    piano.addSession(startTime: Date.now, endTime: Date.now.addingTimeInterval(86400))
    piano.addSession(startTime: Date.now.addingTimeInterval(2400), endTime: Date.now.addingTimeInterval(8400))
    piano.addSession(startTime: Date.now.addingTimeInterval(-82400), endTime: Date.now.addingTimeInterval(-76400))
    piano.addSession(startTime: Date.now.addingTimeInterval(-85400), endTime: Date.now.addingTimeInterval(-80400))

    return NavigationStack {
        ActivityDetailView(
            activity: .constant(piano), // Use `.constant` for preview bindings
            navigationPath: .constant([.activity(piano)])
        )
    }
}
