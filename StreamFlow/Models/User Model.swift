//
//  Model.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import Foundation

struct User {
    var id: String
    var name: String
    var email: String
    var joined: TimeInterval

    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email,
            "joined": joined
        ]
    }
}
