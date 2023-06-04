//
//  UIViewControllerExt.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import UIKit

extension UIViewController {
    static func instantiate<T>(storyBoard: String? = "Main") -> T {
        let storyboard = UIStoryboard(name: storyBoard!, bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
