//
//  TweetRowView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 11.10.2022.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                // userinfo & tweet caption
                VStack(alignment: .leading
                ) {
                    
                    // user info
                    HStack {
                        Text("Bruse Wayne")
                            .font(.subheadline).bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet caption
                    Text("I believe in Harley Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
            }
            
            // action buttons
            HStack() {
                
                Button {
                    // acction goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.headline)
                }
                
                Spacer()
                
                Button {
                    // acction goes here...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.headline)
                }
                Spacer()
                
                Button {
                    // acction goes here...
                } label: {
                    Image(systemName: "heart")
                        .font(.headline)
                }
                Spacer()
                
                Button {
                    // acction goes here...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.headline)
                }

            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
