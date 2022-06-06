//
//  ApiManager.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//
import Foundation

class ApiManager {
    
    // MARK: - Properties
    public static let shared: ApiManager = ApiManager()
    
    public var baseURL: String = "https://api.binance.com/api/v3"
}

// MARK: - Public Functions
extension ApiManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            LogManager.req(request)
        }
        
        /// Comment for rest service
        let data = try! Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Response", ofType: "json")!), options: NSData.ReadingOptions.mappedIfSafe)
        
        /// Uncomment for rest service
//        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
//            guard let data = data, var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
            guard var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
                LogManager.err(error)

                completion(Result.failure(error))
                return
            }

            responseModel.rawData = data
            responseModel.request = request

            if request.isLoggingEnabled.1 {
                LogManager.res(responseModel)
            }
        
            if responseModel.isSuccess, let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorModel.generalError()))
            }

        /// Uncomment for rest service
//        }.resume()
    }
}
