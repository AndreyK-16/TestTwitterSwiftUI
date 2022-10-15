//
//  FeedView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI

struct FeedView: View {
    
    @State private var isShowNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                ForEach(0...20, id: \.self) { _ in
                    TweetRowView()
                }
            }
            
            Button {
                isShowNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowNewTweetView) {
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
