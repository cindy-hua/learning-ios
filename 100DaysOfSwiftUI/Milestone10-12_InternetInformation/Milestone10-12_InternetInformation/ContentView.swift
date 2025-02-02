//
//  ContentView.swift
//  Milestone10-12_InternetInformation
//
//  Created by HUA Cindy on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    UserListItemView(user: user)
                }
                
            }
            .navigationTitle("Users")
            .task {
                users = await UserService.getUsers()
            }
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
        }
    }
}

#Preview {
    ContentView()
}
