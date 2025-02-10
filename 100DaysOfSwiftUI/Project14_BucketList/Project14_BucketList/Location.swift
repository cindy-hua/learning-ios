//
//  Location.swift
//  Project14_BucketList
//
//  Created by HUA Cindy on 10/02/2025.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
