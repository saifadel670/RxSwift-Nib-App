//
//  DynamicHeightTableView.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit

final class DynamicHeightTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
}
