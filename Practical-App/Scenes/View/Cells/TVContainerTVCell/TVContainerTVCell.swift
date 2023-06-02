//
//  TVContainerTVCell.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit
import RxSwift

class TVContainerTVCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: DynamicHeightTableView!
    
    //MARK: - Local Storage-
    
    private let viewModel = TableViewVM()
    private let disposable = DisposeBag()
    
    // MARK: - Cell lifecycle-
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupBindings()
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

//MARK: - RX binding

extension TVContainerTVCell {
    func setupBindings() {
        viewModel
            .movieList
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieTableViewCell.cellIdentifier, cellType: MovieTableViewCell.self)) {  (row,vm,cell) in
                cell.eachCell = vm
            }
            .disposed(by: disposable)   
    }
}

// MARK: - UI functionalities

extension TVContainerTVCell {
    func setView() {
        tableView.register(MovieTableViewCell.getNib(), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
    }
    
    public func setViewModelData(_ models: [MovieCellModel]) {
        viewModel.setData(models)
    }
}
