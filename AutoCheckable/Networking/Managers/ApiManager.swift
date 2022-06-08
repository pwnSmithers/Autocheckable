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
    
    public var baseURL: String = "https://api.staging.myautochek.com/v1/inventory"
}

// MARK: - Public Functions
extension ApiManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            LogManager.req(request)
        }
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
                LogManager.err(error)

                completion(Result.failure(error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(jsonData))
            } catch let error {
                return completion(Result.failure(ErrorModel(error.localizedDescription)))
            }
        }.resume()
    }
}
