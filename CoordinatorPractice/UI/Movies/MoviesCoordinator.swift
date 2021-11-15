//
//  Movies.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 15.11.2021..
//

import UIKit

final class MoviesCoordiantor: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let viewController = MoviesViewController()
        let viewModel = MoviesViewModel(tvMazeService: TVMazeService(dataService: DataService())) // inject?
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
        
        return viewController
    }
}
