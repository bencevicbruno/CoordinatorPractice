//
//  TVMazeService.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import Foundation

enum TVMazeServiceError: Error {
    case badJSON
}

protocol TVMazeServiceProtocol {
    func searchShows(byKeyword keyword: String, completionHandler: @escaping (Result<[TVMazeShow], Error>) -> Void)
}

final class TVMazeService: TVMazeServiceProtocol {
    var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func searchShows(byKeyword keyword: String, completionHandler: @escaping (Result<[TVMazeShow], Error>) -> Void) {
        let url = "https://api.tvmaze.com/search/shows?q=\(keyword)"
        
        dataService.fetchData(from: url) { result in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([TVMazeShowResponse].self, from: data)
                    let shows = response.map { TVMazeShow.init(from: $0) }
                    
                    DispatchQueue.main.async {
                        completionHandler(.success(shows))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
                
                
            }
        }
    }
    
    
}
