//
//  LoginView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 15.10.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            
//          header view
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .foregroundColor(.white)
            .frame(height: 260)
            .background(.blue)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
//            email, password view
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
//          Forgot Password
            HStack {
                Spacer()
                NavigationLink {
                    Text("Reset password view...")
                } label: {
                    Text("Forgot Password?")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.vertical)
                        .padding(.trailing)
                }
            }
            
//            Sign in
            Button {
                print("Sign in here...")
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(Capsule())
            }
            .padding()
            .shadow(color: .gray.opacity(0.5), radius: 15, x: 2, y: 2)

            Spacer()
            
//            Sign Up
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an acciunt?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.blue)
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
