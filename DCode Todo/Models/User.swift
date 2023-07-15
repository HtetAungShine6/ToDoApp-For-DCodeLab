//
//  User.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import Foundation
struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
