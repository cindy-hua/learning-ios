//
//  Project12_SwiftDataApp.swift
//  Project12_SwiftData
//
//  Created by HUA Cindy on 17/01/2025.
//

import SwiftUI

@main
struct Project12_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expenses.self)
    }
}
