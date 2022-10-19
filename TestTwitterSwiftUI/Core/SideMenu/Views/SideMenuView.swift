//
//  SideMenuView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 13.10.2022.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
// MARK: logo, name, username
        VStack {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                
                Text("@batman")
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                
// MARK: following, followers
                UserStatsView()
                    .padding(.vertical)
                
// MARK: table profile and etc.
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SideMenuOptionView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionView(viewModel: viewModel)
                        }
                    } else {
                        SideMenuOptionView(viewModel: viewModel)
                    }
                    
                }
                .padding(.vertical, 4)
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
