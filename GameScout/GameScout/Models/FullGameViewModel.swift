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
            request.httpBody = "fields name, summary, genres, screenshots, videos, first_release_date, rating; where id = \(ID);".data(using: .utf8, allowLossyConversion: false)
            request.httpMethod = "POST"
            request.setValue("\(PlistParser.getStringValue(forKey: "Client-ID"))", forHTTPHeaderField: "Client-ID")
            request.setValue("\(PlistParser.getStringValue(forKey: "Authorization"))", forHTTPHeaderField: "Authorization")
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
