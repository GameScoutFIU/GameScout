//
//  StorageService.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import Foundation
import Firebase
import FirebaseStorage

class StorageService {
    static var storage = Storage.storage()
    static var storageRoot = storage.reference()
    static var storageProfile = storageRoot.child("profile")
    static var storagePost = storageRoot.child("posts")
}
