//
//  PopularCarsRequestModel.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation

class PopularCarsRequestModel: RequestModel {
    override var path: String {
        return "/make?popular=true"
    }
}
