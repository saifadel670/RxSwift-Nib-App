//
//  AppImages.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit

enum AppImage {
    case movilePlaceholder
    
    var image: UIImage? {
        switch self {
        case .movilePlaceholder:
            return UIImage(named: "movie_PlaceHolder")
        }
    }
}
