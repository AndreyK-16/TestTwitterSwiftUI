//
//  ContentView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var isShowMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            // if logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(isShowMenu)
            
            if isShowMenu {
                ZStack {
                    Color(.black)
                        .opacity(isShowMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeIn) {
                        isShowMenu.toggle()
                    }
                }
                .ignoresSafeArea()
                
                
            }
            SideMenuView()
                .frame(width: 300)
                .offset(x: isShowMenu ? 0 : -300, y: 0)
                .background(isShowMenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        isShowMenu.toggle()
                    }
                } label: {
                    if let user = viewModel.currentUser {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    } else {
                        Circle()
                            .foregroundColor(.gray).opacity(0.3)
                            .frame(width: 32, height: 32)
                    }
                    
                }
            }
        }
        .onAppear {
            isShowMenu = false
        }
    }
}
