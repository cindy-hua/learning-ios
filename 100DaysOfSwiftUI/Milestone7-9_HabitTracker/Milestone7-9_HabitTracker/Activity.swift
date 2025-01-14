//
//  Activity.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import Foundation
import Observation

struct Activity: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
}

@Observable
class Activities {
    var list = [Activity]() {
        didSet {
            saveActivities()
        }
    }
    
    init(list: [Activity]? = nil) {
        if let list = list {
            self.list = list
        } else {
            loadActivities()
        }
    }
    
    func add(newActivity: Activity) {
        guard !newActivity.name.isEmpty else { return }
        list.append(newActivity)
    }
    
    private func saveActivities() {
        do {
            let encoded = try JSONEncoder().encode(list)
            UserDefaults.standard.set(encoded, forKey: "Items")
        } catch {
            print("Failed to save activities: \(error)")
        }
    }
    
    private func loadActivities() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Items") else {return }
        do {
            list = try JSONDecoder().decode([Activity].self, from: savedItems)
        } catch {
            print("Failed to load activities: \(error)")
        }
    }
}


