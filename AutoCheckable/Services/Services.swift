//
//  Services.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation

class Services {
    class func popularCars(completion: @escaping(Swift.Result<Popular, ErrorModel>) -> Void) {
        ApiManager.shared.sendRequest(request: PopularCarsRequestModel()) { result in
            completion(result)
        }
    }
    
    class func searchCars(completion: @escaping(Swift.Result<Cars, ErrorModel>) -> Void) {
        ApiManager.shared.sendRequest(request: AllCarsRequestModel()) { result in
            completion(result)
        }
    }
}
