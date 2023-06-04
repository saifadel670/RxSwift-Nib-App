//
//  CornerCurvedView.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit

class CornerCurvedView: UIView {

    @IBInspectable var radiousValue: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = radiousValue
        }
    }
}

