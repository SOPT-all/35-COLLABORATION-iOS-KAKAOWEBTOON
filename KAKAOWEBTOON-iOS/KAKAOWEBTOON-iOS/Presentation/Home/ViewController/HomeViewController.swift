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
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
            AdSectionCell.self, forCellWithReuseIdentifier: AdSectionCell.reuseIdentifier
        )
        
        rootView.collectionView.register(
            AllToonsSectionCell.self, forCellWithReuseIdentifier: AllToonsSectionCell.reuseIdentifier
        )
        
        rootView.collectionView.register(
            AllToonsSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AllToonsSectionHeaderView.Identifier
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
            return 9 //서버 넘어오면 model 받아서 indexPath.row로..
        case .addSection:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = HomeSection.allCases[indexPath.section]
        
        switch sectionType {
        case .adSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdSectionCell.reuseIdentifier, for: indexPath) as? AdSectionCell
            else {
                return UICollectionViewCell()
            }
            return cell
        case .toonCategorySection:
            return UICollectionViewCell()
        case .allToonsSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllToonsSectionCell.reuseIdentifier, for: indexPath) as? AllToonsSectionCell 
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: .init(title: "sss", image: .imgHomeCharcter))
            return cell
        case .addSection:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 28)
        }
    
    func collectionView(_ collectionView: UICollectionView,
                            viewForSupplementaryElementOfKind kind: String,
                            at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = HomeSection.allCases[indexPath.section]
        
        switch sectionType {
        case .allToonsSection:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AllToonsSectionHeaerView", for: indexPath) as! AllToonsSectionHeaderView
            return header
        default:
            return UICollectionReusableView()
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
