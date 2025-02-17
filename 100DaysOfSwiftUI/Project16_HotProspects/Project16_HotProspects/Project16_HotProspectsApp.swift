//
//  Project16_HotProspectsApp.swift
//  Project16_HotProspects
//
//  Created by HUA Cindy on 17/02/2025.
//

import SwiftData
import SwiftUI

@main
struct Project16_HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
