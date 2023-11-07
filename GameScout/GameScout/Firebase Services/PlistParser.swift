//
//  PlistParser.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import Foundation

//read plist file PROD-Keys and grab the value

class PlistParser {
    static func getStringValue(forKey key: String) -> String {
        guard let path = Bundle.main.path(forResource: "PROD-Keys", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let plist = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainers, format: nil) as? [String: Any],
              let value = plist[key] as? String else {
            fatalError("Couldn't find key '\(key)' in 'PROD-Keys.plist'.")
        }
        return value
    }
}
