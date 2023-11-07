//
//  FullGameViewModel.swift
//  GameScout
//
//  Created by Erick Rivera on 11/6/23.
//

import Foundation

final class FullGameViewModel: ObservableObject {
    @Published var FullGameInfo: [FullGameDetails] = []
    
    func fetchData(ID: Int) {
        let url = URL(string: "https://api.igdb.com/v4/games")!
            var request = URLRequest.init(url: url)
            request.httpBody = "fields name, summary, genres, screenshots, videos, release_dates, rating; where id = \(ID);".data(using: .utf8, allowLossyConversion: false)
            request.httpMethod = "POST"
            request.setValue("7el5i0mj1vlr6yt4c158qh9z45llc4", forHTTPHeaderField: "Client-ID")
            request.setValue("Bearer gpfwrlxplr59kw985o1pzlmxczi0wd", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) {
            [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Fetch failed(Cover): \(error.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    if let data = data,
                       let FullGameInfo = try? decoder.decode([FullGameDetails].self, from: data) {
                        self?.FullGameInfo = FullGameInfo
                    } else {
                        
                    }
                }
            }
        }.resume()
    }
}
