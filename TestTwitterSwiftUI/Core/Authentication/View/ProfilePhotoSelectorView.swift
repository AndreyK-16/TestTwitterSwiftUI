//
//  PhotoSelectorView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 20.10.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var isShowImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Setup account",
                           subtitle: "Add a profile photo")
            
            Button {
                print("Pick image here...")
                isShowImagePicker.toggle()
            } label: {
                Image("plusPhoto")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isShowImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
