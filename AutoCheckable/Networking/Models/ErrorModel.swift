//
//  ErrorModel.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

class ErrorModel: Error {
    
    // MARK: - Properties
    var messageKey: String
    var message: String {
        return messageKey.localized()
    }
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

// MARK: - Public Functions
extension ErrorModel {
    
    class func generalError() -> ErrorModel {
        return ErrorModel(ErrorKey.general.rawValue)
    }
}
