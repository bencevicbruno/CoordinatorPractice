//
//  DataService.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import Foundation

protocol DataServiceProtocol {
    func fetchData<T: Decodable>(from url: String, completionHandler: @escaping (Result<T, Error>) -> Void)
}

enum DataServiceError: Error {
    case badURL
    case badJSON
    case noData
}

final class DataService: DataServiceProtocol {
    func fetchData<T: Decodable>(from url: String, completionHandler: @escaping (Result<T, Error>) -> Void) {
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
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data!)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(DataServiceError.badJSON))
                }
            }.resume()
        }
}
