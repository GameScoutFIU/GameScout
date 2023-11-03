//
//  CloseView.swift
//  GameScout
//
//  Created by Team 4 on 11/3/23.
//

import SwiftUI

struct CloseView: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }).accentColor(.white)
            }
    }
}

extension View {
    func applyClose() -> some View {
        self.modifier(CloseView())
    }
}
