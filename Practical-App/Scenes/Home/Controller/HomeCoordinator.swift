//
//  HomeCoordinator.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import Foundation
import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private unowned var navigationController: UINavigationController
    public weak var coordinator: CoordinatorProtocol?
    private  var controller: HomeVC
    
    init(navigationController: UINavigationController,controller: HomeVC = HomeVC()) {
        self.navigationController = navigationController
        self.controller = controller
    }
        
    func start() {
        controller = .instantiate()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)

    }
}
