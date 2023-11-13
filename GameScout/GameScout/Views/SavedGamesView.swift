//
//  SavedGamesView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct SavedGamesView: View {
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(0..<10) { _ in
                        SavedGamePreview()
                    }
                }.padding([.horizontal, .vertical])
            }
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
