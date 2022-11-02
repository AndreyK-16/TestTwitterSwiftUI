//
//  UploadTweetViewModel.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 02.11.2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // show error message to user..
            }
        }
    }
}
