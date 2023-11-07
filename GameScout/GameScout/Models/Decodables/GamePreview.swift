//
//  GamePreview.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct GamePreview: Identifiable, Codable {
    let id: Int
    var cover: Int? = nil
    let name: String
    let summary: String?
}
