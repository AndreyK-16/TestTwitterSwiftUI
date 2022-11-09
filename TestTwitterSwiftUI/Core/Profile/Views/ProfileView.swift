//
//  ProfileView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfo
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "batman",
                               fullname: "Bruce Wayne",
                               profileImageUrl: "",
                               email: "batman@gmail.com"))
    }
}


extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            ZStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .padding()
                        .offset(x: 16)
                }
            }
            
            KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .padding()
                    .offset(x: 16, y: 34)
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
                Text(viewModel.actionButtonTitle)
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
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
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
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)

    }
    
// MARK: Tweet filter bar
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id:\.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                    .foregroundColor(selectedFilter == item ? .black : .gray)
                
                if selectedFilter == item {
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "filter", in: animation)
                } else {
                    Capsule()
                        .foregroundColor(.clear)
                        .frame(height: 3)
                }
            }
                .onTapGesture {
                    withAnimation(.easeIn) {
                        self.selectedFilter = item
                    }
                    
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
// MARK: Tweets View
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
