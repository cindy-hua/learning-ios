//
//  UserDetailView.swift
//  Milestone10-12_InternetInformation
//
//  Created by HUA Cindy on 02/02/2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        List {
            basicInformation
            about
            tags
            friends
        }
        .navigationTitle(user.name ?? "None")
    }
}

extension UserDetailView {
    var basicInformation: some View {
        Section("Basic Information") {
            HStack {
                Text("ID:")
                Spacer()
                Text(user.id ?? "None")
            }
            HStack {
                Text("Date registred:")
                Spacer()
                Text(user.formattedDate)
            }
            HStack {
                Text("Status")
                Spacer()
                Text(user.isActive == true ? "Active" : "Non active")
                    .foregroundStyle(user.isActive == true ? .green : .gray)
            }
            HStack {
                Text("Age:")
                Spacer()
                Text(user.age != nil ? "\(user.age!)" : "None")
            }
            HStack {
                Text("Company:")
                Spacer()
                Text(user.company ?? "None")
            }
            HStack {
                Text("Email:")
                Spacer()
                Text(user.email ?? "None")
            }
            HStack {
                Text("Address:")
                Spacer()
                Text(user.address ?? "None")
            }
        }
    }
    
    var about: some View {
        Section("About") {
            Text(user.about ?? "None")
        }
    }
    
    var tags: some View {
        Section("Tags") {
            if let tags = user.tags {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(tags, id: \.self) {tag in
                            Text(tag)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(.pink.opacity(0.4))
                                .clipShape(.capsule)
                        }
                    }
                }
            }
        }
    }
    
    var friends: some View {
        Section("Friends") {
            if let friends = user.friends {
                LazyVGrid(columns: [GridItem(), GridItem()], content: {
                    ForEach(friends, id: \.self) {friend in
                        Text(friend.name ?? "-")
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(.blue.opacity(0.4))
                            .clipShape(.capsule)
                    }
                })
            }
        }
    }
}

#Preview {
    let user = User(id: UUID().uuidString, isActive: true, name: "Taylor Swift", age: 35, company: "13 Management", email: "taylor@swift.com", address: "242 West Main Street", about: "I like her songs.", tags: ["Singer"], friends: [Friend(id: UUID().uuidString, name: "Friend 1"), Friend(id: UUID().uuidString, name: "Friend 2")], registred: Date())
    
    
    return NavigationStack {
        UserDetailView(user: user)
    }
}
