//
//  User.swift
//  Milestone10-12_InternetInformation
//
//  Created by HUA Cindy on 02/02/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String?
    let isActive: Bool?
    let name: String?
    let age: Int?
    let company: String?
    let email: String?
    let address: String?
    let about: String?
    let tags: [String]?
    let friends: [Friend]?
    let registred: Date?
    
    var formattedDate: String {
        guard let registred = registred else {
            return "-"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        return dateFormatter.string(from: registred)
    }
}

