//
//  HomeView.swift
//  GameScout
//
//  Created by Tomas Maglione on 11/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    @StateObject private var trgvm = TrendingGameViewModel()
    @StateObject private var rgvm = RecommendedGameViewModel()
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        NavigationLink(destination: GameInfoView(id: 215769, name: "Cyberpunk 2077: Phantom Liberty", cover: 333294)) {
                            TopGameView()
                        }
                        VStack (alignment: .leading){
                            GameTabNav(TabTitle: "Trending")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(trgvm.TrendingGameInfo) {
                                        game in
                                        NavigationLink(destination: GameInfoView(id: game.gameID, name: game.title, cover: game.cover)){
                                            
                                            GameTabPreview(Title: game.title, image_id: game.image_id)
                                        }
                                    }
                                }
                            }.padding([.leading, .trailing], 8)
                        }
                        VStack (alignment: .leading) {
                            GameTabNav(TabTitle: "Recommended Games")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(rgvm.RecommendedGameInfo) {
                                        game in
                                        NavigationLink(destination: GameInfoView(id: game.gameID, name: game.title, cover: game.cover)){
                                            
                                            GameTabPreview(Title: game.title, image_id: game.image_id)
                                        }
                                    }
                                }
                            }.padding([.leading, .trailing], 8)
                        }
                    }.padding(.horizontal, 16)
                }.ignoresSafeArea(edges: .top)
                    .background(Color("theme"))
            }
        }.onAppear{
            trgvm.getData()
            rgvm.getData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView().environmentObject(SessionServiceImpl()).navigationBarHidden(true)
        }
    }
}
