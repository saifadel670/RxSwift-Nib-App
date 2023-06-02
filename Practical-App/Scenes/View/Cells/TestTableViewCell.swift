//
//  TestTableViewCell.swift
//  Practical-App
//
//  Created by Saif Adel on 2/6/23.
//

import UIKit
import RxSwift
import RxCocoa

class TestTableViewCell: UITableViewCell {
    static let cellIdentifier = "TestTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secondViewHeight: NSLayoutConstraint!
    private let disposable = DisposeBag()
    public let movieList : BehaviorRelay<[Int]> = BehaviorRelay(value: [5,6,4])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBindings()
        setView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView() {
        tableView.register(MovieTableViewCell.getNib(), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
    }
    
    public func setViewModelData(_ models: [MovieListCellVM]) {
//        viewModel.setData(models)
    }

    
    func setupBindings() {
        movieList
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieTableViewCell.cellIdentifier, cellType: MovieTableViewCell.self)) {  (row,vm,cell) in

            }
            .disposed(by: disposable)
        
    }
    
}
