//
//  SearchTextView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct SearchTextView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 35
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, sfSymbol != nil ? textFieldLeading : 0)
            .foregroundStyle(.white)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .font(.system(size: 15, weight: .semibold, design: .rounded))
            .padding([.top, .bottom], 6)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("theme"))
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

//#Preview {
//    SearchTextView(text: .constant(""), placeholder: "Search", keyboardType: .default, sfSymbol: "magnifyingglass")
//}
struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(text: .constant(""), placeholder: "Search", keyboardType: .default, sfSymbol: "magnifyingglass")
    }
}
