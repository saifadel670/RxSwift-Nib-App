//
//  AppCoordinator.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    private let navigationController = UINavigationController()
    var childCoordinators: [CoordinatorProtocol] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        homeCoordinator.start()
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
