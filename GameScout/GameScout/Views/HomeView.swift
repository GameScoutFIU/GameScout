//
//  HomeView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    TopGameView()
                    
                    GameTabNav(TabTitle: "Trending")
                    
                    GameTabNav(TabTitle: "Recommended Games")
                }.padding(.horizontal, 16)
            }.ignoresSafeArea(edges: .top)
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
