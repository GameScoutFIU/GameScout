//
//  GameTabNavView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct GameTabNav: View {
    let TabTitle: String
    var body: some View {
        VStack (alignment: .leading) {
            Text(TabTitle)
                .bold()
                .foregroundColor(.white)
                .padding([.top, .bottom, .leading])
//            HStack {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(0..<5) { _ in
//                            GameTabPreview()
//                        }
//                    }
//                }.padding([.leading, .trailing], 8)
//                    
//            }
        }
    }
}

#Preview {
    GameTabNav(TabTitle: "Trending")
}
