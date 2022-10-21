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
    @Published var didAuthenticateUser = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in ...")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Register with email \(email)")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
//            self.userSession = user // this line is commented out so that after registration in RegistrationView will load ProfilePhotoSelectionView
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: user is \(self.userSession)")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    print("DEBUG: Did upload user data...   didAuthenticateUser = \(self.didAuthenticateUser)")
                }
        }
    }
    
    func signOut() {
        // set user session to nil so we login view
        userSession = nil
        
        // signs user out on server
        try? Auth.auth().signOut()
    }
}
