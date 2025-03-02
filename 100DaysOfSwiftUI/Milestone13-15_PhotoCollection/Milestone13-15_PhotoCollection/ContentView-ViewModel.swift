//
//  ContentView-ViewModel.swift
//  Milestone13-15_PhotoCollection
//
//  Created by HUA Cindy on 13/02/2025.
//

import Foundation

@Observable
class ViewModel {
    var items: [Item]
    let savePath = URL.documentsDirectory.appending(path: "SavedItems")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([Item].self, from: data)
        } catch {
            items = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            print("Data saved successfully to \(savePath)")
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
    
    func addImage(imageData: Data, name: String) {
        items.append(Item(imageData: imageData, name: name))
        save()
    }
    
    
    
}

