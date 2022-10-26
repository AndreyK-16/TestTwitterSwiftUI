//
//  User.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 26.10.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}

