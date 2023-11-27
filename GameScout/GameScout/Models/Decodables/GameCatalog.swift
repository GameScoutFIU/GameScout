//
//  GameCatalog.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import SwiftUI

struct GameCatalog: Identifiable, Codable {
    let id: String
    let cover: Int
    let gameID: Int
    let image_id: String
    let title: String
}
