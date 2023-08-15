//
//  DiffableDatasourceViewController.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/12.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class DiffableDatasourceViewController: UIViewController {
    
    // MARK: - Property
    
    private enum Section: Int {
        case main
    }
    
    private var dummySample = [SampleModel(id: 1, title: "first", content: "first content"),
                               SampleModel(id: 2, title: "second", content: "second content"),
                               SampleModel(id: 3, title: "thirt", content: "third content")]
    
    // MARK: - UI Property
    
    typealias DataSource = UICollectionViewDiffableDataSource
    private let sampleCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: 300, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return collectionView
    }()
    private var sampleDataSource: DataSource<Section, SampleModel.ID>!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCellRegistration()
//        setCollectionViewLayout()
        setDataSource()
        setLayout()
        loadSampleData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // MARK: - Setting
    
    private func setCellRegistration() {
        sampleCollectionView.register(SampleCell.self, forCellWithReuseIdentifier: SampleCell.identifier)
    }
    
    private func setDataSource() {
        let sampleCellRegistration = UICollectionView.CellRegistration<SampleCell, SampleModel> { cell, indexPath, sample in
            cell.configureCell(sample.title, sample.content)
        }
        sampleDataSource = DataSource(collectionView: sampleCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let item = self.dummySample[indexPath.item]
            return collectionView.dequeueConfiguredReusableCell(using: sampleCellRegistration,
                                                                for: indexPath,
                                                                item: item)
        })
    }
    
    private func setLayout() {
        view.addSubview(sampleCollectionView)
        sampleCollectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Action Helper
    
    private func loadSampleData() {
        let sampleIDs = dummySample.map { $0.id }
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, SampleModel.ID>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(sampleIDs, toSection: .main)
        sampleDataSource.applySnapshotUsingReloadData(initialSnapshot)
    }
    
    // MARK: - Custom Method
    
    
    
    
}
