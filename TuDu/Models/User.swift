//
//  User.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 10/08/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
