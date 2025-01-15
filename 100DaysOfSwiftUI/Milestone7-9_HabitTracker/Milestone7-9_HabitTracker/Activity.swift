//
//  Activity.swift
//  Milestone7-9_HabitTracker
//
//  Created by HUA Cindy on 14/01/2025.
//

import Foundation
import Observation


struct Activity: Identifiable, Codable, Hashable {
    struct Session: Identifiable, Codable, Hashable {
        var id = UUID()
        var startTime: Date
        var endTime: Date
    }
    
    var id = UUID()
    var name: String
    var description: String
    var sessions: [Session] = []
    
    mutating func addSession(startTime: Date, endTime: Date) {
        sessions.append(Session(startTime: startTime, endTime: endTime))
    }
}

@Observable
class Activities {
    var list = [Activity]() {
        didSet {
            saveActivities()
        }
    }
    
    init(list: [Activity] = [Activity]()) {
        if list != [Activity]() {
            self.list = list
            print("Initialized with provided list")
        } else {
            print("Attempting to load activities from UserDefaults")
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
            print("Activities saved successfully")
        } catch {
            print("Failed to save activities: \(error)")
        }
    }
    
    private func loadActivities() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Items") else {
            print("No saved activities found")
            return
        }
        do {
            list = try JSONDecoder().decode([Activity].self, from: savedItems)
            print("Activities loaded successfully")
        } catch {
            print("Failed to load activities: \(error)")
        }
    }
}


