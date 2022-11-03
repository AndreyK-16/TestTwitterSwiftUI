//
//  TweetService.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 02.11.2022.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document()
            .setData(data) { error in
                
                if let error = error {
                    print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    /// Функция для получения твитов на вкладке Home, твиты упорядочены по времени создания.
    /// The function  is used to fetch tweets to HomeView, a tweets is ordered by timestamp.
    func fetchTweet(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self) })
                completion(tweets)
                
            }
    }
    ///Функция для получения твитов во вкладке Профиль, твиты упорядочены по времени создания и от пользователя-владельца профиля.
    ///The finction is used to fetch tweet to ProfileView,  a tweets is ordered by timestamp.
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
}
