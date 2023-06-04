////
////  TestVC.swift
////  Practical-App
////
////  Created by Saif Adel on 31/5/23.
////
//
//import UIKit
//import RxSwift
//import RxCocoa
//
//class TestVC: UIViewController {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    private let homeVM = HomeVM()
//    private let disposable = DisposeBag()
//    public var coordinator: HomeCoordinator?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .brown
////        collectionView.register(TestCVCell.self, forCellWithReuseIdentifier: "TestCVCell")
//        collectionView.register(BannerCollectionViewCell.getNib(), forCellWithReuseIdentifier: BannerCollectionViewCell.cellIdentifier)
//        setupBindings()
//    }
//    
//    func setupBindings() {
////        homeVM
////            .numberOfCellsForCV
////            .bind(to: self.collectionView.rx.items) { (cv, row, item) -> UICollectionViewCell in
////                return item
////            }.disposed(by: disposable)
//        
//        homeVM
//            .numberOfCellsForCV
//            .observeOn(MainScheduler.instance)
//            .bind(to: collectionView.rx.items(cellIdentifier: BannerCollectionViewCell.cellIdentifier, cellType: BannerCollectionViewCell.self)) {  (row,vm,cell) in
//                cell.contentView.backgroundColor = .brown
//                
//            }
//            .disposed(by: disposable)
//    }
//}
//
//
//extension UICollectionViewLayout {
//    
//    static func bannerCollectionViewLayout(collectionView:UICollectionView) -> UICollectionViewLayout {
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height )
//        layout.minimumLineSpacing = 0
//       // layout.sectionInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0);
//        return layout
//    }
//}
