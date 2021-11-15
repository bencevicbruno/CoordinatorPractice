//
//  DataService.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import Foundation

protocol DataServiceProtocol {
    func fetchData(from url: String, completionHandler: @escaping (Result<Data, Error>) -> Void)
}

enum DataServiceError: Error {
    case badURL
    case urlSession
    case noData
}

final class DataService: DataServiceProtocol {
    func fetchData(from url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(DataServiceError.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completionHandler(.failure(error!))
                return
            }
            
            if data == nil {
                completionHandler(.failure(DataServiceError.noData))
                return
            }
            
            completionHandler(.success(data!))
        }.resume()
    }
}
