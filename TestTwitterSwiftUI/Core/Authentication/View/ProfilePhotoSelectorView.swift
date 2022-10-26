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
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Setup account",
                           subtitle: "Add a profile photo")
            
            Button {
                print("Pick image here...")
                isShowImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image("plusPhoto")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $isShowImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(Capsule())
                }
                .padding()
                .shadow(color: .gray.opacity(0.5), radius: 15, x: 2, y: 2)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
///    функция  загружает картинку из памяти телефона на аватарку, используется в кложуре onDismiss в модификаторе .sheet
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .foregroundColor(.blue)
            .clipShape(Circle())
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
