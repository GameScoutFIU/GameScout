//
//  SwiftUIView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/6/23.
//

import SwiftUI

struct FullGameDetails: Identifiable, Decodable {
    let id: Int
    let first_release_date: Int?
    let genres: [Int]?
    let name: String
    let rating: Double?
    let screenshots: [Int]?
    let summary: String?
    let videos: [Int]?
}
