//
//  SavedGamePreview.swift
//  GameScout
//
//  Created by Elvis Blanco on 11/5/23.
//

import SwiftUI

struct SavedGamePreview: View {
    @StateObject private var ca = CoverArtViewModel()
    var Title: String
    var image_id: Int = -1
    var body: some View {
        ZStack {
            if(image_id == -1) {
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 3.5)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .ignoresSafeArea()
                    .overlay(Text("No Image").foregroundStyle(.white), alignment: .center)
                    .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
            } else {
                ZStack {
                    ForEach(ca.CoverArtInfo) { art in
                        AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(art.image_id).jpg")) {
                            image in image.resizable()
                        } placeholder: {
                            Color.gray.edgesIgnoringSafeArea(.all)
                                .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 3.5).overlay(ProgressView())
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 3.5)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea()
                .overlay(GameTabTextOverlay(Title: Title), alignment: .bottomLeading)
            }
        }.onAppear {
            if (image_id != -1) {
                ca.fetchData(ID: image_id)
            }
        }
    }
}

//#Preview {
//    SavedGamePreview()
//}
struct SavedGamePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        SavedGamePreview(Title: "Starfield")
    }
}
