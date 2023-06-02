//
//  CoordinatorProtocol.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] {get}
    func start()
    func popViewController()
}
extension CoordinatorProtocol{
    func popViewController(){}
}

