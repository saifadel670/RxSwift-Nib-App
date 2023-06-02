//
//  MovieListModel.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//


import Foundation

enum MovieListModel{
    
    struct Response : Codable {
        let results : [Results]?
    }
    
    struct Results : Codable {
        let backdrop_path : String?
        let id : Int?
        let original_title : String?
        let overview : String?
        let poster_path : String?
        let release_date : String?
        let title : String?
    }
    
    struct Request: Decodable {
        
    }

}

