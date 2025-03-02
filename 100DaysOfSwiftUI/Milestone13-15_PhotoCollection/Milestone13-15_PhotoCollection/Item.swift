//
//  Item.swift
//  Milestone13-15_PhotoCollection
//
//  Created by HUA Cindy on 13/02/2025.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Comparable, Codable {
    var id = UUID()
    var imageData: Data
    var name: String
    
    var image: Image {
        if let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "photo")
        }
    }
    
    static func <(lhs: Item, rhs: Item) -> Bool {
        lhs.name < rhs.name
    }
}


