//
//  AddSessionView.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import SwiftUI

struct AddSessionView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var activity: Activity
    
    @State private var startTime = Date.now
    @State private var endTime = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Begin", selection: $startTime)
            DatePicker("End", selection: $endTime)
        }
        .navigationTitle("New \(activity.name.lowercased()) session")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Save") {
                guard endTime > startTime else {
                    print("End time must be after start time")
                    return
                }
                activity.addSession(startTime: startTime, endTime: endTime)
                dismiss()
            }
        }
    }
}

#Preview {
    @State var piano = Activity(name: "Piano", description: "I love that")
    return AddSessionView(activity: $piano)
}
