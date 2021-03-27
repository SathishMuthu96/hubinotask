//
//  User.swift
//  HubinoTask
//
//  Created by Greens on 10/03/21.
//  Copyright © 2021 Greens. All rights reserved.
//

import Foundation

struct User: Codable {
    let result: [results]
}
struct  results: Codable {
    let id: Int?
    let firstname: String?
    let lastname: String?
    let birthday: String?
    let age: String?
    let email: String?
    let mobileno: String?
    let address: String?
    let contactperson: String?
    let cpmobileno: String?
}
