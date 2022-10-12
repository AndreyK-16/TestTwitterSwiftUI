//
//  ProfileView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfo
            
            
            Spacer()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    // action
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                
                Circle()
                    .frame(width: 72, height: 72)
                    .padding()
                    .offset(x: 16, y: 34)
            }
        }
        .frame(height: 96)
        .padding(.bottom)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                //action
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

                
        }
        .padding(.trailing)
    }
    
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
// MARK: name, subscription
            HStack {
                Text("Heath ledger")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
// MARK: location and link
            HStack(spacing: 32) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham. NY")
                }
                Spacer()
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.thejoker.com")
                }
            }
            .foregroundColor(.gray)
            .font(.caption)
        
// MARK: following, followers
            HStack(spacing: 32) {
                HStack(spacing: 4) {
                    Text("812")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                HStack(spacing: 4)  {
                    Text("1.5M")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)

    }
}
