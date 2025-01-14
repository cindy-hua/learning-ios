//
//  ActivityDetailView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    
    
    var body: some View {
        VStack {
            Text("\(activity.name)")
        }
        .navigationTitle("\(activity.name) Overview")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let piano = Activity(name: "Piano", description: "I love that")
    return ActivityDetailView(activity: piano)
}
