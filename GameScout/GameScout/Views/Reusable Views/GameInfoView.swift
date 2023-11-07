//
//  GameInfoView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct TextOverlayInfo: View {
    var name: String
    var release_dates: String
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text(name)
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title)
                Text("2023")
                    .foregroundStyle(.white)
                //                .padding(.leading)
                //                .padding(.bottom)
            }
        }.padding(6)
    }
}

struct BookMarkButton: View {
    var body: some View {
        Button(action: {
            print("Bookmark button was tapped")
        }) {
            Image(systemName: "bookmark.fill")
                .font(.title)
                .foregroundColor(.white)
                .padding([.bottom,.trailing], 6)
        }
    }
}

struct TopImage: View {
    @StateObject private var svm = ScreenshotViewModel()
    var name: String
    var release_dates: Int
    var imageID: [Int]?
    var body: some View {
        ZStack (alignment: .bottomLeading){
            if(imageID == nil) {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                    .foregroundStyle(.gray)
                    .overlay(Text("No Images").foregroundStyle(.white), alignment: .center)
            } else {
                ForEach(svm.ScreenshotInfo) { screen in
                    AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_original/\(screen.image_id).jpg")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.edgesIgnoringSafeArea(.all)
                            .frame(minWidth: 60, maxWidth: 60, minHeight: 90, maxHeight: 90).overlay(ProgressView())
                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                        .clipped()
                        .ignoresSafeArea()
                        .overlay(Color.black.opacity(0.3))
                        .overlay(TextOverlayInfo(name: name, release_dates: "2023"),
                        alignment: .bottomLeading)
                        .overlay(BookMarkButton(), alignment: .bottomTrailing)
                }
            }
//            Image("placeholder")
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
//                .clipped()
//                .ignoresSafeArea()
//                .overlay(Color.black.opacity(0.3))
//                .overlay(TextOverlayInfo(name: name, release_dates: "2023"),
//                alignment: .bottomLeading)
//                .overlay(BookMarkButton(), alignment: .bottomTrailing)
        }.onAppear{svm.fetchData(ID: imageID ?? [0])}
    }
}

struct Gamedescription: View {
    @StateObject private var svm = ScreenshotViewModel()
    var genres: [Int]?
    var videoID: [Int]?
    var imageID: [Int]?
    var summary: String?
    var rating: Double?
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Horror")
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                Label(String(Int(rating ?? 100)), systemImage: "star.fill")
                    .bold()
                    .foregroundColor(.white)
                
            }.padding([.leading,.trailing])
            
            ScrollView ([.horizontal]){
                HStack {
                    if(imageID == nil) {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/1.1, height: 200)
                            .foregroundStyle(Color("theme"))
                            .border(.white, width: 0.2)
                            .clipShape(RoundedRectangle(cornerRadius: 1))
                            .padding(.leading)
                            .overlay(Text("No Images").foregroundStyle(.white), alignment: .center)
                       
                    } else {
                        ForEach(svm.ScreenshotInfo) { screen in
                            AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_original/\(screen.image_id).jpg")) { image in
                                image.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray.edgesIgnoringSafeArea(.all)
                                    .frame(minWidth: 60, maxWidth: 60, minHeight: 90, maxHeight: 90).overlay(ProgressView())
                            }.frame(width: UIScreen.main.bounds.width/1.1, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                .padding(.leading)
                        }
                    }
                }
            }

            Text(summary ?? "No Summary Available")
                .foregroundStyle(.white)
                .padding([.leading,.trailing])
                .padding([.top, .bottom])
                .font(.caption)
        }.onAppear{svm.fetchData(ID: imageID ?? [0])}

    }
}

struct GameInfoView: View {
    @StateObject private var fg = FullGameViewModel()
    var id: Int
    var name: String
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading, spacing: 20){
                //Call TopImage passing obs name and release_dates
                ForEach(fg.FullGameInfo) { game in
                    TopImage(name: game.name, release_dates: 2023, imageID: game.screenshots)
                    Gamedescription(genres: game.genres, videoID: game.videos, imageID: game.screenshots, summary: game.summary, rating: game.rating)
                }
                Spacer()
            }.ignoresSafeArea(edges: .top)
        }.onAppear{fg.fetchData(ID: id)}
    }
}

#Preview {
    GameInfoView(id: 32, name: "Starfield")
}
