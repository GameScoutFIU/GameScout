//
//  TopGameView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct TextOverlay: View {
    var title: String
    var body: some View {
        ZStack {
            Text(title)
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
    @StateObject private var tgvm = TopGameViewModel()
    var body: some View {
        ZStack (alignment: .bottomLeading){
            ForEach(tgvm.TopGameInfo) { game in
                AsyncImage(url: URL(string: game.image_id)){ image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                        .overlay(ProgressView(), alignment: .center)
//                    Color.gray.edgesIgnoringSafeArea(.all)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                    .clipped()
                    .ignoresSafeArea()
//                    .overlay(Color.black.opacity(0.3))
                    .overlay(TextOverlay(title: game.title), alignment: .bottomLeading)
            }
//            Image("placeholder")
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
//                .clipped()
//                .ignoresSafeArea()
//                .overlay(TextOverlay(),
//                alignment: .bottomLeading)
        }.onAppear{tgvm.getData()}
    }
}

//#Preview {
//    TopGameView()
//}

struct TopGameView_Previews: PreviewProvider {
    static var previews: some View {
        TopGameView()
    }
}
