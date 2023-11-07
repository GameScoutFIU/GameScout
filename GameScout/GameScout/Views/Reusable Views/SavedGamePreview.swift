//
//  SavedGamePreview.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct SavedGamePreview: View {
    let Title: String = "Starfield"
    var body: some View {
        Image("placeholder")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 3.5)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .ignoresSafeArea()
            .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
    }
}

#Preview {
    SavedGamePreview()
}
