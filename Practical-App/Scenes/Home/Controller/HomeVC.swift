//
//  ViewController.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import UIKit
import RxSwift
import RxCocoa
import Reachability
import RxReachability

class HomeVC: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
        
    //MARK: - Local Storage-
    
    public var coordinator: HomeCoordinator?
    private let disposable = DisposeBag()
    private let reachability: Reachability! = try? Reachability()
    private let activity = ActivityIndicator()
    private let homeVM = HomeVM()

    // MARK: - View lifecycle-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.viewDidLoad(self)
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? reachability.startNotifier()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
    }
}

//MARK: - RX binding

extension HomeVC {
    func setupBindings() {
        reachability?.rx.isReachable
            .subscribe(onNext: { [weak self] isReachable in
                isReachable ? self?.fetchDataFromApi() : ToastView.shared.short(self?.view, txt_msg: "Please check your internet!")
            })
            .disposed(by: disposable)
        
        homeVM
            .loading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                isLoading ? self?.activity.showLoading(view: self?.view) : self?.activity.hideLoading()
            })
            .disposed(by: disposable)
        
        homeVM
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                ToastView.shared.short(self?.view, txt_msg: "  \(error)  ")
            })
            .disposed(by: disposable)
        
        homeVM
            .tableViewCells
            .observeOn(MainScheduler.instance)
            .bind(to: self.tableView.rx.items) { (tv, row, item) -> UITableViewCell in

                return item
            }.disposed(by: disposable)
    }
}

// MARK: - UI functionalities

extension HomeVC {
    fileprivate func fetchDataFromApi() {
        homeVM.getDataWith(resource: homeVM.createResource() as! Resource<MovieListModel.Response>)
    }
}


// MARK: - CellUpdateDelegate-

extension HomeVC : CellUpdateDelegate {
    func updateTabelViewCellSize(for cellNumber : Int) {
        let childCell : MovieTableViewCell = MovieTableViewCell.getCell()

        if let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TVContainerTVCell {
            self.tableView.beginUpdates()
            cell.viewHeight.constant = (childCell.contentView.bounds.height * CGFloat(cellNumber))
            self.tableView.endUpdates()
        }
    }
}
