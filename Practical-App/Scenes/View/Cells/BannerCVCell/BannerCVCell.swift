//
//  BannerCollectionViewCell.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit


class BannerCVCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var imageView: ImageViewCustomCorner!
    
    // MARK: - Cell lifecycle-
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var eachCell:MovieCellModel! {
        
        didSet {
            guard let url = eachCell?.coverUrl else {
                return
            }
            
            let placeholderImage = AppImage.movilePlaceholder.image
            self.imageView.getImage(url: url, placeholderImage:placeholderImage) { (success) in
            } failer: { [weak self] (faield) in
                self?.imageView.image = placeholderImage
            }
        }
    }
    
}

// MARK: - Static Ref-

extension BannerCVCell {
    static let cellIdentifier = "BannerCVCell"
    
    public static func getNib() -> UINib {
        UINib(nibName: BannerCVCell.cellIdentifier, bundle: .main)
    }
}
