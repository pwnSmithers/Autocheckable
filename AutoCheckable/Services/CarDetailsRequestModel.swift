//
//  CarDetailsRequestModel.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 07/06/2022.
//

import Foundation

class CarDetailsRequestModel: RequestModel {
    var carID = ""
    
    init(carID: String) {
        self.carID = carID
    }
    
    override var path: String {
        return "/car/\(carID)"
    }
}
