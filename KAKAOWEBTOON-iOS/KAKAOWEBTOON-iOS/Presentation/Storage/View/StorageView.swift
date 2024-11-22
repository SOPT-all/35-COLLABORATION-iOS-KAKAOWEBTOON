//
//  StorageView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

import SnapKit

class StorageView: UIView {
    
    // MARK: - Properties
    
    private var categoryTabs: [CategoryTabView] = []
    
    // MARK: - UI Properties
    
    let storageHeaderView = CategorySelectorView()
    
    let storageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionHeadersPinToVisibleBounds = true
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
        addViewsToArray()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        self.addSubviews(storageHeaderView, storageCollectionView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        storageHeaderView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        storageCollectionView.snp.makeConstraints {
            $0.top.equalTo(storageHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func addViewsToArray() {
        categoryTabs.append(storageHeaderView.recentTab)
        categoryTabs.append(storageHeaderView.saveTab)
        categoryTabs.append(storageHeaderView.buyTab)
        categoryTabs.append(storageHeaderView.downloadTab)
        categoryTabs.append(storageHeaderView.commentTab)
    }
    
    // MARK: - Funcs
    
    func categoryTabToggle(_ tab: CategoryTabView) {
        categoryTabs.forEach { view in
            view.isSelected = false
        }
        tab.isSelected = true
    }
    
}
