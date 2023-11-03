//
//  TextInputView.swift
//  GameScout
//
//  Created by Team 4 on 11/3/23.
//

import SwiftUI

struct TextInputView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, sfSymbol != nil ? textFieldLeading : 0)
            .foregroundStyle(.white)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .disableAutocorrection(true)
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
    TextInputView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
}
