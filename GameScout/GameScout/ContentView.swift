//
//  ContentView.swift
//  GameScout
//
//  Created by Team 4 on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sessionService = SessionServiceImpl()
    var body: some View {
        TabView {
            HomeView().environmentObject(sessionService)
                .tabItem {Image(systemName: "book.pages")}
            SearchView().environmentObject(sessionService)
                .tabItem {Image(systemName: "magnifyingglass")}
            SavedGamesView().environmentObject(sessionService)
                .tabItem {Image(systemName: "bookmark.fill")}
            ProfileView().environmentObject(sessionService)
                .tabItem {Image(systemName: "person")}
        }
        .toolbarBackground(Color("theme"), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .accentColor(.white)
        
        //change tabview bar color to theme
        
    }
}

#Preview {
    ContentView()
}
