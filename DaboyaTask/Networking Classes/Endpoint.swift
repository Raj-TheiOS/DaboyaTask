//
//  Endpoint.swift
//  DaboyaTask
//
//  Created by Raj Rathod on 22/10/21.
//

import Foundation

enum Endpoint {
    case photos
    
    var url: URL {
        var baseUrl = "https://picsum.photos/v2/"
        switch self {
        case .photos: baseUrl.append("list?page=1&limit=100")
        }
        return URL(string: baseUrl)!
    }
}
