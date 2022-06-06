//
//  ResponseModel.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    
    // MARK: - Properties
    var error: ErrorModel {
        return ErrorModel("Something happened")
    }
    var rawData: Data?
    var data: T?
    var json: String? {
        guard let rawData = rawData else { return nil }
        return String(data: rawData, encoding: String.Encoding.utf8)
    }
    var request: RequestModel?

    
    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        data = try? keyedContainer.decode(T.self, forKey: CodingKeys.data)
    }
}

// MARK: - Private Functions
extension ResponseModel {

    private enum CodingKeys: String, CodingKey {
        case data
    }
}
