//
//  AddActivityView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var activityName: String = ""
    @State private var activityDescription: String = ""
    
    var activities : Activities
    
    var body: some View {
        ZStack {
            Background()
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Activity name", text: $activityName)
                    TextField("Small Description", text: $activityDescription)
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("Add a new activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    if activityName.count > 0 {
                        activities.add(newActivity: Activity(name: activityName, description: activityDescription))
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let activities = Activities()
    return AddActivityView(activities: activities)
}
