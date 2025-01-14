//
//  AddSessionView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

struct AddSessionView: View {
    var activity: Activity
    
    @State private var start = Date.now
    @State private var end = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Begin", selection: $start)
            DatePicker("End", selection: $end)
        }
        .navigationTitle("New \(activity.name.lowercased()) session")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let piano = Activity(name: "Piano", description: "I love that")
    return AddSessionView(activity: piano)
}
