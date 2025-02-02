//
//  UserService.swift
//  Milestone10-12_InternetInformation
//
//  Created by HUA Cindy on 02/02/2025.
//

import Foundation

enum UserService {
    static func getUsers() async -> [User] {
        let urlStr = "https://www.hackingwithswift.com/samples/friendface.json"
        
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([User].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
