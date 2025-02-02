//
//  UserListItemView.swift
//  Milestone10-12_InternetInformation
//
//  Created by HUA Cindy on 02/02/2025.
//

import SwiftUI

struct UserListItemView: View {
    let user: User
    
    var body: some View {
        HStack {
            Text(user.name ?? "NoName")
            Spacer()
            Text(user.isActive == true ? "Active" : "Non active")
                .foregroundStyle(user.isActive == true ? .green : .gray)
        }
    }
}
