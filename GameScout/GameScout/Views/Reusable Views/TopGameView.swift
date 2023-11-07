//
//  TopGameView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct TextOverlay: View {
    var body: some View {
        ZStack {
            Text("Starfield")
                .textCase(.uppercase)
                .bold()
                .foregroundColor(.white)
                .font(.title)
//                .padding(.leading)
//                .padding(.bottom)
        }.background(Color.black)
            .opacity(0.9)
            .padding(6)
    }
}

struct TopGameView: View {
    var body: some View {
        ZStack (alignment: .bottomLeading){
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                .clipped()
                .ignoresSafeArea()
                .overlay(TextOverlay(),
                alignment: .bottomLeading)
        }
    }
}

#Preview {
    TopGameView()
}
