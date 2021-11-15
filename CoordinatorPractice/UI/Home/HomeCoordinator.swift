//
//  HomeCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class HomeCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let viewController = HomeViewController()
        let viewModel = HomeViewModel()
        
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
        
        return viewController
    }
}
