//
//  ImageViewCustomCorner.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit

class ImageViewCustomCorner: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: .allCorners,
                                    cornerRadii: CGSize(width: 10, height: 10))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
