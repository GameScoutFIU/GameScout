//
//  SavedGames.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import SwiftUI

struct SavedGames: Identifiable, Codable {
    let id: Int
    let gameID: [Int]
}
