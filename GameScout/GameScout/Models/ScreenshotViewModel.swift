//
//  ScreenshotViewModel.swift
//  GameScout
//
//  Created by Erick Rivera on 11/6/23.
//

import Foundation

final class ScreenshotViewModel: ObservableObject {
    @Published var ScreenshotInfo: [ScreenshotDetails] = []
    //(174733, 174734, 174735, 174736, 174737)
    func fetchData(ID: [Int]) {
        let formattedArray = ID.map{String($0)}.joined(separator: ",")
        print(formattedArray)
        let url = URL(string: "https://api.igdb.com/v4/screenshots")!
            var request = URLRequest.init(url: url)
            request.httpBody = "fields image_id; where id = (\(formattedArray));".data(using: .utf8, allowLossyConversion: false)
            request.httpMethod = "POST"
            request.setValue("\(PlistParser.getStringValue(forKey: "Client-ID"))", forHTTPHeaderField: "Client-ID")
            request.setValue("\(PlistParser.getStringValue(forKey: "Authorization"))", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) {
            [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Fetch failed(Screenshot): \(error.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    if let data = data,
                       let ScreenshotInfo = try? decoder.decode([ScreenshotDetails].self, from: data) {
                        self?.ScreenshotInfo = ScreenshotInfo
                    } else {
                        
                    }
                }
            }
        }.resume()
    }
}
