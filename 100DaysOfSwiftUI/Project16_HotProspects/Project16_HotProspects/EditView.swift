//
//  EditView.swift
//  Project16_HotProspects
//
//  Created by HUA Cindy on 17/02/2025.
//

import SwiftUI

struct EditView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var prospect: Prospect
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            TextField("Name", text: $prospect.name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onDisappear {
                    try? modelContext.save()
                }
            
            TextField("Email Adress", text: $prospect.emailAddress)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onDisappear {
                    try? modelContext.save()
                }
        }
    }
}

