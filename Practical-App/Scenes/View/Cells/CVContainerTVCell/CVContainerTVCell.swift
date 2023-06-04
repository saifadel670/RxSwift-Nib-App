//
//  CVForTableViewCell.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit
import RxSwift
import RxCocoa

class CVContainerTVCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Local Storage-
    
    private let viewModel = CollectionViewVM()
    private let disposable = DisposeBag()
    
    // MARK: - Cell lifecycle-
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupBindings()
        setView()
    }
}

//MARK: - RX binding

extension CVContainerTVCell {
    private func setupBindings() {
        viewModel
            .itemList
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: BannerCVCell.cellIdentifier, cellType: BannerCVCell.self)) {  (row,vm,cell) in
                cell.eachCell = vm
            }
            .disposed(by: disposable)
    }
}

// MARK: - UI functionalities

extension CVContainerTVCell {
    func setView() {
        collectionView.register(BannerCVCell.getNib(), forCellWithReuseIdentifier: BannerCVCell.cellIdentifier)
        setCollectionViewLayout()
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.8, height: collectionView.bounds.height * 0.86 )
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: 0);
        collectionView.collectionViewLayout = layout
    }
    
    public func setViewModelData(_ models: [MovieCellModel]) {
        viewModel.setData(models)
    }
}
