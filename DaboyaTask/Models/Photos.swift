//
//  User.swift
//  DaboyaTask
//
//  Created by Raj Rathod on 22/10/21.
//

import Foundation

struct Photos: Decodable {
    let id, author, download_url, url: String
    let height, width: Int
}
