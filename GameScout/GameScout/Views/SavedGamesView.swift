//
//  SavedGamesView.swift
//  GameScout
//
//  Created by Elvis Blanco on 11/5/23.
//

import SwiftUI

struct SavedGamesView: View {
    @StateObject private var sgvm = SavedGamesViewModel()
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        ZStack {
//            Color("theme").edgesIgnoringSafeArea(.all)
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(sgvm.SavedGameInfo) { game in
                                NavigationLink(destination: GameInfoView(id: game.gameID, name: game.title, cover: game.image_id)){
                                    SavedGamePreview(Title: game.title, image_id: game.image_id)
                                }
                            }
                    }.padding([.horizontal, .vertical])
                }/*.ignoresSafeArea(edges: .top)*/
                    .background(Color("theme"))
            }
        }.onAppear {
            sgvm.getData(username: sessionService.userDetails?.username ?? "N/A")
            //if preview crashes put itserick as the username or your account username (firebase)
        }
    }
}

//#Preview {
//    SavedGamesView()
//}
struct SavedGamesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedGamesView()
    }
}
