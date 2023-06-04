//
//  TableViewVM.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import RxCocoa
import RxSwift

class TableViewVM {
    
    //MARK: - Local Storage-
    
    public let movieList : PublishSubject<[MovieCellModel]> = PublishSubject()
    
    
    func setData(_ models : [MovieCellModel]) {
        self.movieList.onNext(models)
    }
}
