//
//  NewTweetView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 15.10.2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            
// MARK: Buttons navigation header
            VStack {
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
                        viewModel.uploadTweet(withCaption: caption)
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
            }
            .onReceive(viewModel.$didUploadTweet) { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
// MARK: Profile image, placeholder
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .frame(width: 64, height: 64)
                }
                
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
