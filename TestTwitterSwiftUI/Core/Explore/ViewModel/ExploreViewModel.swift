//
//  ExploreViewModel.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 02.11.2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users: \(users)")
        }
    }
}
