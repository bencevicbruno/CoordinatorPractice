//
//  MainCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class MainCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let tabBarController = createTabBarController()
        
        return tabBarController
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = childCoordinators.map { coordinator, tabBarItem in
            let viewController = coordinator.start()
            viewController.tabBarItem = tabBarItem
            return viewController
        }
        
        tabBarController.view?.window?.rootViewController = tabBarController
        tabBarController.tabBar.backgroundColor = .white
        
        return tabBarController
    }
    
    private var childCoordinators: [(Coordinator, UITabBarItem)] = [
        (HomeCoordinator(), UITabBarItem(title: "Home", image: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill"))),
        (MoviesCoordiantor(), UITabBarItem(title: "Movies", image: UIImage(systemName: "film")!, selectedImage: UIImage(systemName: "film.fill")!)),
        (MyProfileCoordinator(), UITabBarItem(title: "My Profile", image: UIImage(systemName: "person")!, selectedImage: UIImage(systemName: "person.fill")!)),
    ]
}
