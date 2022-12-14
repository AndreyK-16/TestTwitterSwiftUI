//
//  Tweet.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 03.11.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didlike: Bool? = false
}
