//
//  Favorites.swift
//  Project19_SnowSeeker
//
//  Created by HUA Cindy on 21/02/2025.
//

import Foundation
import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>

    private let key = "Favorites"

    init() {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            if let decodedResorts = try? JSONDecoder().decode(Set<String>.self, from: savedData) {
                resorts = decodedResorts
                return
            }
        }
        
        // Default to an empty set if no saved data exists
        resorts = []
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    private func save() {
        if let encodedData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
}
