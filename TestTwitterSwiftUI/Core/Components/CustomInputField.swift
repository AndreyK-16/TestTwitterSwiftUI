//
//  CustomInputField.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 15.10.2022.
//

import SwiftUI

struct CustomInputField: View {
    
// MARK: constants, variables
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(.gray)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         text: .constant(""))
    }
}
