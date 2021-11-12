//
//  MyProfileCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

final class MyProfileCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let viewController = MyProfileViewController()
        
        navigationController.pushViewController(viewController, animated: true)
        
        return viewController
    }
}

