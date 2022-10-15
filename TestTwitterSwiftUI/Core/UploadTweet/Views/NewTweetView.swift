//
//  NewTweetView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 15.10.2022.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            
// MARK: Buttons navigation header
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Spacer()
                
                Button {
                    print("press to tweet new post ")
                } label: {
                    Text("Tweet")
                        .bold()
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.blue)
                .clipShape(Capsule())
            }
            .padding(.horizontal)
            
// MARK: Profile image, placeholder
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
