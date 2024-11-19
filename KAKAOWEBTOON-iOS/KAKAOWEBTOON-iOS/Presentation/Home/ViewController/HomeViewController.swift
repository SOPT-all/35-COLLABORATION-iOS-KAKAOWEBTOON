//
//  HomeViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private let rootView = HomeView()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        self.view.backgroundColor = .black3
        
        setDelegate()
        register()
        setupNavigationBar()
    }
    
    // MARK: - Private Func
    
    private func setDelegate() {
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
    }
    
    private func register() {
        rootView.collectionView.register(
            adSectionCell.self, forCellWithReuseIdentifier: adSectionCell.reuseIdentifier
        )
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return HomeSection.allCases.count
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sectionType = HomeSection.allCases[section]
        
        switch sectionType {
        case .adSection:
            return 1
        case .toonCategorySection:
            return 0
        case .allToonsSection:
            return 0
        case .addSection:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = HomeSection.allCases[indexPath.section]
        
        switch sectionType {
        case .adSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adSectionCell.reuseIdentifier, for: indexPath) as? adSectionCell
            else { return UICollectionViewCell() }
            return cell
        case .toonCategorySection:
            return UICollectionViewCell()
        case .allToonsSection:
            return UICollectionViewCell()
        case .addSection:
            return UICollectionViewCell()
        }
    }
    
    
    // MARK: Set up NavigationBar
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = .black3
        
        let leftCoinBarButton: UIBarButtonItem = {
            let btn = UIBarButtonItem()
            btn.image = .icCoin
            btn.tintColor = .white
            //btn.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            return btn
        }()
        let logoImage: UIImageView = {
            let img = UIImageView()
            img.image = .icHomeTooncardLogo
            img.tintColor = .white
            return img
        }()
        let rightMenuButton: UIBarButtonItem = {
            let btn = UIBarButtonItem()
            btn.image = .icMenu
            btn.tintColor = .white
            return btn
        }()
        let rightSearchButton: UIBarButtonItem = {
            let btn = UIBarButtonItem()
            btn.image = .icResearch
            btn.tintColor = .white
            return btn
        }()
    
        navigationItem.leftBarButtonItem = leftCoinBarButton
        navigationItem.titleView = logoImage
        navigationItem.rightBarButtonItems = [rightMenuButton, rightSearchButton]
        
    }
}

#Preview
{
    UINavigationController(rootViewController: HomeViewController())
}
