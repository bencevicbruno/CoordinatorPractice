//
//  RootCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class RootCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let viewController = createMainViewController()
        
        return viewController
    }
    
    private func createMainViewController() -> UIViewController {
        return ViewController()
    }
}
