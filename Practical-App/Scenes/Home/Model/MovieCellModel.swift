//
//  MovieListModel.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//


import Foundation

struct MovieCellModel {
    
    let title: String?
    let description: String?
    let coverUrl: URL?
    
    init(_ vm: MovieListModel.Results){
        self.title = vm.title
        self.description = vm.overview
        self.coverUrl = .posterUrl(vm.backdrop_path ?? "")
    }
}
