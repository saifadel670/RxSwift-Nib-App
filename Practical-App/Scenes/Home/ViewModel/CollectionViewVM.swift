//
//  CollectionViewVM.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import RxCocoa
import RxSwift

class CollectionViewVM {
    
    //MARK: - Local Storage-
    
    public let itemList : PublishSubject<[MovieCellModel]> = PublishSubject()
    
    func setData(_ models : [MovieCellModel]) {
        self.itemList.onNext(models)
    }
}

