//
//  MyProfileViewModel.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

final class MyProfileViewModel {
    let tvMazeService: TVMazeServiceProtocol
    
    init(tvMazeService: TVMazeServiceProtocol) {
        self.tvMazeService = tvMazeService
    }
    
    func onTestButtonTapped() {
        tvMazeService.searchShows(byKeyword: "hust") { result in
            print("lesgo")
            switch result {
            case .success(let shows):
                print(shows)
            case .failure(let error):
                print("ode sve u k \(error)")
            }
        }
    }
}
