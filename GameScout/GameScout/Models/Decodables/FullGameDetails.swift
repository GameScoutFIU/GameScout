//
//  SwiftUIView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/6/23.
//

import SwiftUI

struct FullGameDetails: Identifiable, Decodable {
    let id: Int
    let genres: [Int]?
    let name: String
    let rating: Double?
    let release_dates: [Int]?
    let screenshots: [Int]?
    let summary: String?
    let videos: [Int]?
}
