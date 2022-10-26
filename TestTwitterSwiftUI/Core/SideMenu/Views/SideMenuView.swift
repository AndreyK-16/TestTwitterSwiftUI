//
//  SideMenuView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 13.10.2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            // MARK: logo, name, username
                    VStack {
                        VStack(alignment: .leading) {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 48, height: 48)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullname)
                                    .font(.headline)
                            
                                Text("@\(user.email)")
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
                                        ProfileView(user: user)
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
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
