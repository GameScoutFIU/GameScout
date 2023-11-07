//
//  API Functions.swift
//  GameScout
//
//  Created by Erick Rivera on 11/6/23.
//

import Foundation

final class SearchPreviewViewModel: ObservableObject {
    @Published var SearchPreviewInfo: [GamePreview] = []
    @Published private(set) var isRefreshing = false
    
    func fetchData() {
        isRefreshing = true
        let url = URL(string: "https://api.igdb.com/v4/games")!
            var request = URLRequest.init(url: url)
            request.httpBody = "fields name, summary, cover; limit 100;".data(using: .utf8, allowLossyConversion: false)
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
                       let SearchPreviewInfo = try? decoder.decode([GamePreview].self, from: data) {
                        self?.SearchPreviewInfo = SearchPreviewInfo
                    } else {
                        
                    }
                    self?.isRefreshing = false
                }
            }
        }.resume()
        
    }
}

final class CoverArtViewModel: ObservableObject {
    @Published var CoverArtInfo: [CoverArt] = []
    
    func grabID(ID: Int?) {
       
    }
    
    func fetchData(ID: Int) {
        let url = URL(string: "https://api.igdb.com/v4/covers")!
            var request = URLRequest.init(url: url)
            request.httpBody = "fields image_id; where id=\(ID);".data(using: .utf8, allowLossyConversion: false)
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
                       let CoverArtInfo = try? decoder.decode([CoverArt].self, from: data) {
                        self?.CoverArtInfo = CoverArtInfo
                    } else {
                        
                    }
                }
            }
        }.resume()
        
    }
}

//func coverGrabber(id: Int) -> String {
//    var image_id = ""
//    let url = URL(string: "https://api.igdb.com/v4/covers")!
//    var request = URLRequest.init(url: url)
//    request.httpBody = "fields image_id; where id=\(id);".data(using: .utf8, allowLossyConversion: false)
//    request.httpMethod = "POST"
//    request.setValue("7el5i0mj1vlr6yt4c158qh9z45llc4", forHTTPHeaderField: "Client-ID")
//    request.setValue("Bearer gpfwrlxplr59kw985o1pzlmxczi0wd", forHTTPHeaderField: "Authorization")
//    request.setValue("application/json", forHTTPHeaderField: "Accept")
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        do {
//            if let data = data {
//                let decodedResponse = try JSONDecoder().decode([CoverArt].self, from: data)
//                DispatchQueue.main.async {
//                    image_id = decodedResponse[0].image_id
//                }
//                return
//            }
//        } catch {
//            print("Fetch failed(Cover): \(error)")
//        }
//    }.resume()
//    print(image_id)
//    return image_id
//}
