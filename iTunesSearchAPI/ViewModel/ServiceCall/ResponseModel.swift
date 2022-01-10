//
//  ResponseModel.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 5.01.2022.
//

import Foundation

struct ResponseModel: Codable {
    var resultCount: Int
    var results: [ContentModel]
}
