//
//  UITableViewCellExt.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import UIKit

extension UITableViewCell {
    public static func getCell<T>() -> T {
        let cell = Bundle.main.loadNibNamed("\(T.self)", owner: T.self, options: nil)?.first as! T
        return cell
    }
}



