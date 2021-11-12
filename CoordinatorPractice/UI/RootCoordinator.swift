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
        let mainCoordinator = MainCoordinator()
        
        self.childCoordinator = mainCoordinator
        let mainVC = mainCoordinator.start()
        mainVC.view.window?.rootViewController = mainVC
        mainVC.view.window?.makeKeyAndVisible()
        
        return mainVC
    }
}
