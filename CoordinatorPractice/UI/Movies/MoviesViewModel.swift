//
//  MoviesViewModel.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

final class MoviesViewModel {
    let tvMazeService: TVMazeServiceProtocol
    
    var shows = [TVMazeShow]()
    
    var showError: ((Error) -> Void)?
    
    init(tvMazeService: TVMazeService) {
        self.tvMazeService = tvMazeService
    }
    
    func searchButtonTapped(searchKey: String, successHandler: @escaping () -> Void) {
        self.tvMazeService.searchShows(byKeyword: searchKey) { [weak self] result in
            switch result {
            case .success(let shows):
                self?.shows = shows
                print(self?.shows)
                successHandler()
            case .failure(let error):
                self?.showError?(error)
            }
        }
    }
}
