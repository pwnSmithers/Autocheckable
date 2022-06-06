//
//  Popular.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation

// MARK: - Popular
struct Popular: Codable {
    let makeList: [MakeList]
    let pagination: Pagination
}

// MARK: - MakeList
struct MakeList: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, currentPage, pageSize: Int
}
