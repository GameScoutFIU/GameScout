//
//  PasswordInputView.swift
//  GameScout
//
//  Created by Team 4 on 11/3/23.
//

import SwiftUI

struct PasswordInputView: View {
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        SecureField(placeholder, text: $password)
            .padding(.leading, sfSymbol != nil ? textFieldLeading : 0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("mainColor"))
                    .stroke(Color.white, lineWidth: 1)
            )
            .overlay(
                HStack {
                    if let sfSymbol = sfSymbol {
                        Image(systemName: sfSymbol)
                            .foregroundColor(Color.white)
                            .padding(.leading, 10)
                    }
                    Spacer()
                }
            )
        
    }
}

#Preview {
    PasswordInputView(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
}
