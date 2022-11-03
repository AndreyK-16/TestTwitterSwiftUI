//
//  ProfileViewModel.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 03.11.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        fetchTweets()
    }
    
    private func fetchTweets() {
        guard let uid = user.id else { return }
        
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in  0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
