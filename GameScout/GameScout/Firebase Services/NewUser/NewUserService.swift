//
//  NewUserService.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum NewUserKeys: String {
    case firstName
    case lastName
    case username
}

protocol NewUserService {
    func register(with details: NewUserInfo) -> AnyPublisher<Void, Error>
}

final class NewUserServiceImpl: NewUserService {
    func register(with details: NewUserInfo) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            if let uid = res?.user.uid {
                                let values = [NewUserKeys.firstName.rawValue: details.firstName,
                                              NewUserKeys.lastName.rawValue: details.lastName,
                                              NewUserKeys.username.rawValue: details.username] as [String: Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) {
                                        error, ref in
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

