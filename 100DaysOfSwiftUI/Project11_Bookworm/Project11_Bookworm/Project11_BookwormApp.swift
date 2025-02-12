//
//  Project11_BookwormApp.swift
//  Project11_Bookworm
//
//  Created by HUA Cindy on 17/01/2025.
//

import SwiftData
import SwiftUI

@main
struct Project11_BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
