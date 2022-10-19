//
//  AuthViewModel.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 18.10.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Register with email \(email)")
    }
}
