//
//  TestTwitterSwiftUIApp.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI
import Firebase

@main
struct TestTwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}

