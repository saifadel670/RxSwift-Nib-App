//
//  MovieTableViewCell.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var baseContentView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
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
            self.posterImageView.getImage(url: url, placeholderImage:placeholderImage) { (success) in
                self.label.text = self.eachCell.title
                self.descriptionLabel.text = self.eachCell.description
            } failer: { [weak self] (faield) in
                self?.posterImageView.image = placeholderImage
            }
        }
    }
}

// MARK: - Static Ref-

extension MovieTableViewCell {
    static let cellIdentifier = "MovieTableViewCell"
    
    public static func getNib() -> UINib {
        UINib(nibName: MovieTableViewCell.cellIdentifier, bundle: .main)
    }
}
