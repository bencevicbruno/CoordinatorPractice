//
//  SceneDelegate.swift
//  CoordinatorPractice
//
//  Created by Bruno Benčević on 12.11.2021..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if rootCoordinator == nil {
            rootCoordinator = RootCoordinator()
        }
        
        let viewController = rootCoordinator?.start()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
