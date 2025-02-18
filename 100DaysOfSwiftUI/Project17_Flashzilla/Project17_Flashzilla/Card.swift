//
//  Card.swift
//  Project17_Flashzilla
//
//  Created by HUA Cindy on 18/02/2025.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
