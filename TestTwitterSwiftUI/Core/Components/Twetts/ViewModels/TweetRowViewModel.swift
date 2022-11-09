//
//  TweetRowViewModel.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 03.11.2022.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didlike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didlike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didlike = true
            }
        }
    }
}
