//
//  CarMedia.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 07/06/2022.
//

import Foundation

// MARK: - CarMedia
struct CarMedia: Codable {
    let carMediaList: [CarMediaList]
    let pagination: Pagination
}

// MARK: - CarMediaList
struct CarMediaList: Codable {
    let id: Int
    let name: String
    let url: String
    let createdAt, type: String
}
