//
//  HomeVM.swift
//  Practical-App
//
//  Created by Saif Adel on 1/6/23.
//

import RxCocoa
import RxSwift

// MARK: - Delegate Protocol-

protocol CellUpdateDelegate {
    func updateTabelViewCellSize(for cellNumber : Int)
}

class HomeVM {
    
    //MARK: - Local Storage-
    
    private let collectionViewContainerCell : CVContainerTVCell =  CVContainerTVCell.getCell()
    private let tableViewContainerCell : TVContainerTVCell =  TVContainerTVCell.getCell()
    public let tableViewCells : BehaviorRelay<[UITableViewCell]> = BehaviorRelay(value: [])
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<String> = PublishSubject()
    private let disposable = DisposeBag()
    private(set) var delegate: CellUpdateDelegate?

    init() {
        tableViewCells.accept([collectionViewContainerCell, tableViewContainerCell])
    }
    
    func viewDidLoad<T>(_ vc: T) {
        self.delegate = vc.self as? CellUpdateDelegate
    }
}

//MARK: - createResource-

extension HomeVM {
    
    public func createResource() -> Any {
        guard var url = URL.moviePath else {
            fatalError(ErrorMessage.urlFatalError.rawValue)
        }
        url.appendQueryItem(name: APIKEY, value: KEY )
        url.appendQueryItem(name: QUERY, value: QUERYVALUE)

        var resource = Resource<MovieListModel.Response>(url: url)
        resource.httpMethod = .get
        
        return resource
    }
    
   public func getDataWith<T>(resource: Resource<T>)  {
        self.loading.onNext(true)
        
        NetworkManager
            .shared
            .load(resource: resource)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                self?.loading.onNext(false)
                switch response{
                case .success(let data):
                    self?.convertWith(data as! MovieListModel.Response)
                case .failure(_):
                    self?.error.onNext(ErrorMessage.apiRequestFail.rawValue)
                }
            }, onError: {[weak self] (error) in
                self?.loading.onNext(false)
            })
            .disposed(by: disposable)
    }
}

// MARK: - Data Parser

extension HomeVM {
    fileprivate func convertWith(_ vm:MovieListModel.Response) {
        guard let vm = vm.results?.filter({$0.backdrop_path != nil}).map({MovieCellModel($0)}) else { return }
        collectionViewContainerCell.setViewModelData(vm)
        tableViewContainerCell.setViewModelData(vm)
        delegate?.updateTabelViewCellSize(for: vm.count)
    }
}
