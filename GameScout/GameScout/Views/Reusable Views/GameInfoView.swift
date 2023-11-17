//
//  GameInfoView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct TextOverlayInfo: View {
    var name: String
    var release_dates: Int
    var year: String {
        let year = NSDate(timeIntervalSince1970: TimeInterval(release_dates))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let date = dateFormatter.string(from: year as Date)
        return date
    }
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text(name)
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title)
                if(release_dates != 0) {
                    Text(year)
                        .foregroundStyle(.white)
                } else {
                    Text("N/A")
                        .foregroundStyle(.white)
                }
            }
        }.padding(6)
    }
}

struct BookMarkButton: View {
    @StateObject private var sgvm = SavedGamesViewModel()
    @EnvironmentObject var sessionService: SessionServiceImpl
    var gameID: Int
    var title: String
    var cover: Int
    @State var gameSaved = false
    var body: some View {
        ZStack {
            if (gameSaved) {
                Button(action: {
                    print("Bookmark button was tapped")
                    sgvm.deleteSavedGame(gameID: gameID, username: sessionService.userDetails?.username ?? "N/A")
                    gameSaved.toggle()
                }) {
                    Image(systemName: "bookmark.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding([.bottom,.trailing], 6)
                }
            } else {
                Button(action: {
                    sgvm.addSavedGame(gameID: gameID, username: sessionService.userDetails?.username ?? "N/A", image_id: cover, title: title)
                    gameSaved.toggle()
                }) {
                    Image(systemName: "bookmark")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding([.bottom,.trailing], 6)
                }
            }
        }.onAppear {
            if (sgvm.contains(gameID: gameID, username: sessionService.userDetails?.username ?? "N/A")) {
                print("exists")
                print("test section \(sessionService.userDetails?.username ?? "N/A") and \(gameID)")
                gameSaved = true
            } else {
                print("failed")
            }
        }
    }
}

struct TopImage: View {
    @StateObject private var svm = ScreenshotViewModel()
    var name: String
    var release_dates: Int
    var imageID: [Int]?
    var gameID: Int
    var cover: Int
    var body: some View {
        ZStack (alignment: .bottomLeading){
            if(imageID == nil) {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                    .foregroundStyle(.gray)
                    .overlay(Text("No Images").foregroundStyle(.white), alignment: .center)
                    .overlay(BookMarkButton(gameID: gameID, title: name, cover: cover), alignment: .bottomTrailing)
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
                        .overlay(TextOverlayInfo(name: name, release_dates: release_dates),
                        alignment: .bottomLeading)
                        .overlay(BookMarkButton(gameID: gameID, title: name, cover: cover), alignment: .bottomTrailing)
                }
            }
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
    var genresName: String {
        return genreChecker(genreID: genres ?? [0])
    }
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text(genresName)
                    .textCase(.uppercase)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                Label(String(Int(rating ?? 100)), systemImage: "star.fill")
                    .bold()
                    .foregroundColor(.white)
                
            }.padding([.leading,.trailing])
            
            ScrollView ([.horizontal], showsIndicators: false){
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
    var cover: Int
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading, spacing: 20){
                //Call TopImage passing obs name and release_dates
                ForEach(fg.FullGameInfo) { game in
                    TopImage(name: game.name, release_dates: game.first_release_date ?? 0, imageID: game.screenshots, gameID: id, cover: cover)
                    Gamedescription(genres: game.genres, videoID: game.videos, imageID: game.screenshots, summary: game.summary, rating: game.rating)
                }
                Spacer()
            }.ignoresSafeArea(edges: .top)
        }.onAppear{fg.fetchData(ID: id)}
    }
}

//#Preview {
//    GameInfoView(id: 32, name: "Starfield")
//}
struct GameInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoView(id: 32, name: "Starfield", cover: 280467)
    }
}
