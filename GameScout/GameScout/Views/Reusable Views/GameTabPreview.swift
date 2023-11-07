//
//  GameTabPreview.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct GameTabTextOverlay: View {
    let Title: String
    var body: some View {
        ZStack {
            Text("Starfield")
                .textCase(.uppercase)
                .bold()
                .foregroundColor(.white)
                
//                .padding(.leading)
//                .padding(.bottom)
        }.background(Color.black)
            .opacity(0.9)
            .padding(6)
    }
}

struct GameTabPreview: View {
    let Title: String = "Starfield"
    var body: some View {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea()
                .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
    }
}

#Preview {
    GameTabPreview()
}
