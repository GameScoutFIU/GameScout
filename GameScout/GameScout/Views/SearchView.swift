//
//  SearchView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct ListRow: View {
    @StateObject private var ca = CoverArtViewModel()
    var s = "mepwhvsq7xtithbanbb0"
    var eachGame: GamePreview
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(eachGame.name)
                    .bold()
                    .foregroundStyle(.white)
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                Text(eachGame.summary ?? "No Summary Available")
                    .foregroundStyle(.white)
                    .font(.caption)
            }
            .frame(maxHeight: 90)
            Spacer()
         
            if (eachGame.cover == nil) {
                Color.gray.edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 60, maxWidth: 60, minHeight: 90, maxHeight: 90)
                    .overlay(Text("NO IMAGE"), alignment: .center)
            } else {
                ZStack {
                    ForEach(ca.CoverArtInfo) { art in
                        AsyncImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(art.image_id).jpg")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            Color.gray.edgesIgnoringSafeArea(.all)
                                .frame(minWidth: 60, maxWidth: 60, minHeight: 90, maxHeight: 90).overlay(ProgressView())
                        }.frame(width: 60, height: 90)
                        
                    }
                }.onAppear{ca.fetchData(ID: eachGame.cover ?? 0)}
            }
        }
    }
}

struct SearchView: View {
    @StateObject private var sp = SearchPreviewViewModel()
    @State private var searchTerm = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("theme").edgesIgnoringSafeArea(.all)
                VStack {
                    //Search Bar & Filter
                    HStack (spacing: 15){
                        Spacer()
                            .frame(width: 1)
                        SearchTextView(text: $searchTerm, placeholder: "Search", keyboardType: .default, sfSymbol: "magnifyingglass")
                            .onSubmit {
                                if(searchTerm != "") {
                                    sp.fetchDataSearch(term: searchTerm)
                                } else {
                                    sp.fetchData()
                                }
                            }
                        Button {
                            print("Filter")
                        } label: {
                            Text("Filter")
                                .foregroundColor(.white)
                        }.buttonStyle(.bordered)
                        Spacer()
                            .frame(width: 1)
                    }
                        List(sp.SearchPreviewInfo) {
                            game in NavigationLink(destination: GameInfoView(id: game.id, name: game.name, cover: game.cover ?? -1)) {
                                ListRow(eachGame: game)
                            }.listRowBackground(Color("theme"))
                                .listRowSeparatorTint(.white)
                        }.scrollContentBackground(.hidden)
                            .background(Color("theme"))
                }
            }.onAppear(perform: sp.fetchData)
        }
    }
}

//#Preview {
//    SearchView()
//}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
