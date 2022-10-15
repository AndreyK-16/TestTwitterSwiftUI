//
//  AuthHeaderView.swift
//  TestTwitterSwiftUI
//
//  Created by Andrey Kaldyaev on 15.10.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(subtitle)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.leading)
        .foregroundColor(.white)
        .frame(height: 260)
        .background(.blue)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AunthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Hello.", subtitle: "Welcome back")
    }
}
