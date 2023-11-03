//
//  ButtonView.swift
//  GameScout
//
//  Created by Team 4 on 11/3/23.
//

import SwiftUI

struct ButtonView: View {
    typealias ActionHandler = () -> Void
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    private let cornerRadius: CGFloat = 30
    
    internal init(title: String, background: Color = Color.white, foreground: Color = .black, border: Color = .clear, handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(border, lineWidth: 2))
    }
}

#Preview {
    ButtonView(title: "Sign Up", background: .black, foreground: .white, border: .clear) {
        print("Button tapped")
    }
}
