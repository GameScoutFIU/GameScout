//
//  NewUserInfo.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import Foundation

struct NewUserInfo {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var newUser: Bool
}

extension NewUserInfo {
    static var new: NewUserInfo {
        NewUserInfo(email: "",
                    password: "",
                    firstName: "",
                    lastName: "",
                    newUser: true)
    }
}
