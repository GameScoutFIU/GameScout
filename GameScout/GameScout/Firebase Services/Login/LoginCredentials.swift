//
//  LoginCredentials.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    static var new: LoginCredentials {
    LoginCredentials(email: "", password: "")
    }
}
