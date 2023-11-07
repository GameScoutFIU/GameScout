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
            Text(Title)
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
    let Title: String
    let image_id: String
    var body: some View {
        AsyncImage(url: URL(string: image_id)){ image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle().foregroundColor(.gray)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)
                .overlay(ProgressView(), alignment: .center)
        }.frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .ignoresSafeArea()
            .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
        
//            Image(image_id)
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)
//                .clipped()
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .ignoresSafeArea()
//                .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
    }
}

#Preview {
    GameTabPreview(Title: "Marvel's Spider-Man 2", image_id: "https://images.igdb.com/igdb/image/upload/t_original/scfehq.jpg")
}
