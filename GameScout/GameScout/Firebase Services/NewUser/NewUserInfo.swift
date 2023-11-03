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
    var username: String
}

extension NewUserInfo {
    static var new: NewUserInfo {
        NewUserInfo(email: "",
                    password: "",
                    firstName: "",
                    lastName: "",
                    username: "")
    }
}
